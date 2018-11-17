module UtilityHelper
  def modify_date( date )
    date && date.strftime("%B, %Y")
  end
end
