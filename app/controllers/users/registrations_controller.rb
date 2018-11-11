# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: :create

  # POST /resource
  def create
    @user = User.new(signup_params)
    if @user.save
      sign_up(:user, @user)
      redirect_to identify_user_path, notice: I18n.t("devise.registrations.signed_up")
    end
  end

  protected
  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end

  def signup_params
    params.require(:user).permit(:email, :user_name, :name, :password, :type)
  end

  def identify_user_path
    @user.is_business? ? business_complete_profile_path : legal_professional_complete_profile_path
  end

end
