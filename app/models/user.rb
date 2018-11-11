class User < ApplicationRecord
  #constants
  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/ 
  USER_TYPE         = %w(business lawyer)
  ##############################################################################
  #devise modules
  devise :database_authenticatable, :registerable,
         :validatable, :omniauthable, :omniauth_providers => [:facebook]
  ################################################################################
  #validations
  validates :email, :user_name, :name, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: VALID_EMAIL_REGEX }
  ################################################################################
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
  ################################################################################
  USER_TYPE.each do |user_type|
    define_method "is_#{user_type}?" do
      user_type.titleize == self.class.to_s
    end
  end
end
