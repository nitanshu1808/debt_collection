class ApplicationController < ActionController::Base

  protected
  def identify_user_path
    @user.is_business? ? identify_business_redirection_path[:url] : identify_lawyer_redirection_path[:url]
  end

  def sign_in_and_redirect
    sign_in(resource_name, resource)
    redirect_to identify_user_path, notice: I18n.t("devise.sessions.signed_in")
  end

  def render_template
    render "shared/#{params["action"]}"
  end

  def verify_user_profile_completion_path
    if current_user.is_lawyer?
      url_hash = identify_lawyer_redirection_path
      redirect_to url_hash[:url], notice: url_hash[:msg]
    elsif current_user.is_business?
      url_hash = identify_business_redirection_path
      redirect_to url_hash[:url], notice: url_hash[:msg]
    end
  end

  def identify_lawyer_redirection_path
    if current_user.profile_completed?
      {url: claims_path}
    else
      {url: legal_professional_complete_profile_path, msg: profile_completion_error_msg}
    end
  end

  def identify_business_redirection_path
    if current_user.profile_completed?
      {url: business_claims_path(current_user)}
    else
      {url: business_complete_profile_path, msg: I18n.t("error.incomplete_profile")}
    end
  end

end
