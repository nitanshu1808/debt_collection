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

  def identify_user_profile_pic
    current_user.is_lawyer? ? "lawyer_pic.jpg" : "start_up.png"
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

  def message_body(message)
    user = message.user_id == current_user.id ? current_user : @user
    "<b>#{user.user_name}</b>: #{message.body}".html_safe
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

end
