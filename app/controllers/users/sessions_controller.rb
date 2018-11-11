class Users::SessionsController < Devise::SessionsController

  def create
    @user = User.find_by(email:login_params["email"])
    if @user && @user.valid_password?(login_params["password"])
      sign_in_and_redirect
    else
      @user = @user || User.new(login_params)
      @user.errors.add(:password, I18n.t('user.wrong_credentials'))
    end
  end

  private
  def login_params
    params.require(:user).permit(:email, :password)
  end

  def sign_in_and_redirect
    sign_in(resource_name, resource)
    redirect_to identify_user_path, notice: I18n.t("devise.sessions.signed_in")
  end

end
