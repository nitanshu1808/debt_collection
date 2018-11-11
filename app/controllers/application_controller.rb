class ApplicationController < ActionController::Base

  protected
  def identify_user_path
    @user.is_business? ? business_complete_profile_path : legal_professional_complete_profile_path
  end
end
