class User < ApplicationRecord
  #constants
  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/
  USER_TYPE         = %w(business lawyer)

  #devise modules
  devise :database_authenticatable, :registerable,
         :validatable, :omniauthable, :omniauth_providers => [:facebook]

  #validations
  validates :email, :user_name, :name, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: VALID_EMAIL_REGEX }

  #associations
  with_options dependent: :destroy do |assoc|
    assoc.has_one           :provider
    assoc.has_one           :address
    assoc.has_many          :employees, class_name: "User", foreign_key: "employer_id"
    assoc.has_many          :messages
    assoc.has_many          :receiver_conversations, foreign_key: "receiver_id", class_name: 'Conversation'
    assoc.has_many          :sender_conversations,   foreign_key: "sender_id", class_name: 'Conversation'
    assoc.has_one_attached  :image
    assoc.has_one_attached  :cover_image
  end
  belongs_to                :employer, class_name: "User", optional: true

  #nested_attributes
  accepts_nested_attributes_for :provider


  USER_TYPE.each do |user_type|
    define_method "is_#{user_type}?" do
      user_type.titleize == self.class.to_s
    end
  end

  def self.create_or_update_facebook_user(auth)
    user   = User.find_by(user_name: auth[:info][:email]) || User.new
    #checking whether user is created via normal process or by social provider
    if (user.persisted? && user.try(:provider).nil?)
      user.errors.add(:user_name, I18n.t('app.already_exist'))
    else
      user.build_provider if user.new_record?
      user.social_provider_user(auth)
      user.save
    end

    user #returning user
  end

  def social_provider_user(auth)
    self.attributes =
    {
      email:                auth.info.email,
      user_name:            auth.info.name,
      password:             Devise.friendly_token[0,20],
      name:                 auth.info.name,
      provider_attributes: {
        provider_name:    auth.provider,
        uid:              auth.uid,
        image_url:        auth.info.image,
        token:            auth.credentials.token,
        expires:          auth.credentials.expires
      }
    }
  end
end
