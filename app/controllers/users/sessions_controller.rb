class Users::SessionsController < Devise::SessionsController

  def create
    @user = User.find_by(email:login_params["email"])
    if @user && @user.valid_password?(login_params["password"])
      sign_in_and_redirect
    else
      @user = User.new(login_params)
      @user.errors.add(:password, I18n.t('user.wrong_credentials'))
    end
  end

  private
  def login_params
    params.require(:user).permit(:email, :password)
  end

end
