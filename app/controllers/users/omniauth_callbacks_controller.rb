class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    @user = User.create_or_update_facebook_user(request.env["omniauth.auth"], request.env['omniauth.params']['user'])
    if @user.errors.any?
      render 'home/registration'
    else
      set_flash_message(:notice, :success, :kind => I18n.t("app.facebook")) if is_navigational_format?
      sign_in_and_redirect
    end
  end

end
