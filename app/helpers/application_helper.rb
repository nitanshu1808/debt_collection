module ApplicationHelper
  # The method detects the level of class that needs to be displayed in the flash message
  def flash_class(level)
    case level
      when "notice"   then  "alert alert-info"
      when "success"  then  "alert alert-success"
      when "error"    then  "alert alert-danger"
      when "alert"    then  "alert alert-warning"
    end
  end

  def identify_model_form
    "#{params["controller"]}/form"
  end

  def identify_list_class
    ".#{params["controller"]}"
  end

  def identify_partial
    "shared/#{params["controller"]}"
  end

  def identify_modal_header
    I18n.t("app.#{params["controller"]}")
  end

  def identify_instance_variable
    instance_variable_get"@#{params["controller"]}"
  end

  def identify_user_cover_pic
    current_user.is_lawyer? ? "lawyer-coverpic" : "business-coverpic"
  end

  def identify_user_profile_pic(user=nil)
    user     = user || current_user
    image    = user.profile_image
    image_presence =  image.attached?
    provider = user.provider && user.provider.try(:image_url) unless image_presence
    if image_presence || provider
      image_presence ? url_for(image) : provider
    else
      user.is_lawyer? ? "lawyer_pic.jpg" : "start_up.png"
    end
  end

  def amount_currency(number)
    number_to_currency(number, :unit => "€", precision: 2)
  end

  def identify_user_profile
    if current_user
      current_user.is_lawyer? ? legal_professional_path(current_user) : business_path(current_user)
    else
      "javascript:void(0)"
    end
  end

  def is_different_user?
    user = @business || @lawyer
    current_user != user
  end

  def message_sender(message)
    message.user_id == current_user.id ? current_user : @user
  end

  def identify_claim_path
    if params["controller"] == "claims"
      claims_path
    else
      if params["action"] == "index"
        business_claims_path(current_user)
      elsif params["action"] == "request_for_proposals"
        business_request_for_proposals_path(current_user)
      end
    end
  end

  def user_notification
    @notification = Notification.unread_msgs(current_user)
  end

  def real_user(user)
    user && current_user && user.id == current_user.id
  end

  def identify_btn_id
    "#lwyr_" + "#{params["controller"]}"
  end

  def message_class(message)
    message.user_id == current_user.id ? "msg-sndr" : "msg-recvr"
  end

  def message_user_path(user)
    _user = user.id == current_user.id ? current_user : user
    _user.is_lawyer? ? legal_professional_path(_user) : business_path(_user)
  end

end
