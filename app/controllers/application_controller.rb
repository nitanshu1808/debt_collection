class ApplicationController < ActionController::Base

  protected
  def identify_user_path
    identify_user
    @user.is_business? ? identify_business_redirection_path[:url] : identify_lawyer_redirection_path[:url]
  end

  def sign_in_and_redirect
    identify_user
    sign_in(resource_name, resource)
    redirect_to identify_user_path, notice: I18n.t("devise.sessions.signed_in")
  end

  def render_template
    render "shared/#{params["action"]}"
  end

  def verify_user_profile_completion_path
    identify_user
    if @user.is_lawyer?
      url_hash = identify_lawyer_redirection_path
      redirect_to url_hash[:url], notice: url_hash[:msg]
    elsif @user.is_business?
      url_hash = identify_business_redirection_path
      redirect_to url_hash[:url], notice: url_hash[:msg]
    end
  end

  def identify_lawyer_redirection_path
    identify_user
    if @user.profile_completed?
      {url: claims_path}
    else
      {url: legal_professional_complete_profile_path, msg: profile_completion_error_msg}
    end
  end

  def identify_business_redirection_path
    identify_user
    if @user.profile_completed?
      {url: business_claims_path(@user)}
    else
      {url: business_complete_profile_path, msg: I18n.t("error.incomplete_profile")}
    end
  end

  def profile_completion_error_msg
    identify_user
    @user.valid? ? @user.profile_completion_error : I18n.t("error.complete_profile")
  end

  def identify_user
    @user = current_user || @user || @business || @lawyer
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def mark_notification_as_read
    if params["notification_id"].present?
      notification = Notification.find_by(id: params["notification_id"])
      notification.update_attributes(is_read: true)
    end
  end

  def redirect_user_to_path
    redirect_to identify_user_path, notice: I18n.t("devise.failure.already_authenticated")
  end

end
