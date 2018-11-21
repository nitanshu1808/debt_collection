module UtilityHelper
  def modify_date( date )
    date && date.strftime("%B, %Y")
  end

  def modify_date_format(date)
    date && date.strftime("%d %B %y")
  end
end
