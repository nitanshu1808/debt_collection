class ApplicationController < ActionController::Base

  protected
  def identify_user_path
    @user.is_business? ? business_complete_profile_path : legal_professional_complete_profile_path
  end

  def sign_in_and_redirect
    sign_in(resource_name, resource)
    redirect_to identify_user_path, notice: I18n.t("devise.sessions.signed_in")
  end

end
