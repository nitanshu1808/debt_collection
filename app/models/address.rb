class Address < ApplicationRecord
  ################################################################################
  #validations
  validates :name, :city, :county, :postal_code,
              :user_id, presence: true
  ################################################################################
  #associations
  belongs_to :user
  # callbacks
  before_save :check_user_profile

  private
  def check_user_profile
    user.reload
    if user.is_lawyer? && user.reload && user.is_profile_completed?
      user.complete_profile!
    elsif user.is_business?
      user.complete_profile!
    else
      true
    end
  end
end
