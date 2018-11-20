module HomeHelper
  # This helper module provides helper methods for the home view templates

  def login_logout_path
    content_tag :li do
      current_user && logout_path || user_path
    end
  end

  def logout_path
    link_to destroy_user_session_path, method: :delete do
      html_login_span.html_safe + I18n.t("app.logout")
    end
  end

  def user_path
    (params["controller"] == "users/sessions" && params["action"] == "new") ? registration_path : login_path
  end

  def display_user_img
    if current_user
      content_tag :li do
        link_to root_path do
          fetch_image
        end
      end
    end
  end

  def facebook_button
    link_to user_facebook_omniauth_authorize_path do
      image_tag("login_with_fb.png", class: "facebook-logo")
    end
  end

  def login_path
    link_to new_user_session_path do
      html_login_span.html_safe + I18n.t("app.sign_in")
    end
  end

  def registration_path
    link_to business_registration_path do
      html_registration_span.html_safe + I18n.t("app.sign_up")
    end
  end

  def profile_picture_url
    current_user.image_url
  end

  def html_login_span
    content_tag( :span,class: "glyphicon glyphicon-log-in") do "" end + " "
  end

  def html_registration_span
    content_tag( :span,class: "glyphicon glyphicon-user") do "" end + " "
  end

  def user_profile_image_tag(image)
    image_tag(image, alt: "logo", class: 'app-icon img-circle')
  end

  def fetch_image
    profile_picture_url ? user_profile_image_tag(profile_picture_url) : user_profile_image_tag("default_user.png")
  end

  def check_user_type
    @user.is_business? ? I18n.t("app.business") : I18n.t("app.legal_professional")
  end

  def user_claim_path
    current_user.is_business? && business_claims_link || lawyer_claims_link
  end

  def business_claims_link
    link_to business_claims_path do
      html_claim_span.html_safe + I18n.t("app.my_claims")
    end
  end

  def lawyer_claims_link
    link_to claims_path do
      html_claim_span.html_safe + I18n.t("app.claims")
    end
  end

  def html_claim_span
    content_tag(:span, class: " glyphicon glyphicon-gift") do "" end + " "
  end
end
