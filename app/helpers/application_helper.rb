module ApplicationHelper
  # The method detects the level of class that needs to be displayed in the flash message
  def flash_class(level)
    case level
      when "notice"   then  "alert alert-info"
      when "success"  then  "alert alert-success"
      when "danger"   then  "alert alert-danger"
      when "alert"    then  "alert alert-warning"
    end
  end
end
