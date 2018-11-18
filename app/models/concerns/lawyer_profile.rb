module LawyerProfile
  extend ActiveSupport::Concern

  #private methods
  private
  def verify_user_profile_completion
    lawyer.is_profile_completed? && lawyer.update_attributes(profile_completed: true) unless lawyer.profile_completed?
    return true
  end
end
