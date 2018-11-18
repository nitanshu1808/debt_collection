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

end
