class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: :create

  def create
    @user = User.new(signup_params)
    if @user.save
      sign_up_and_redirect
    end
  end

  protected
  def signup_params
    params.require(:user).permit(:email, :user_name, :name, :password, :type)
  end

  def sign_up_and_redirect
    sign_up(:user, @user)
    redirect_to identify_user_path, notice: I18n.t("devise.registrations.signed_up")
  end

end
