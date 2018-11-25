module UtilityHelper
  def modify_date( date )
    date && date.strftime("%B, %Y")
  end

  def modify_date_format(date)
    date && date.strftime("%d %B %y")
  end

  def format_time(date)
    date && date.strftime("%b %d %Y %H:%M %P")
  end
end
