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

  def notification_path( notification )
    notifier =  notification.notifier
    case notification.notifier_type
      when "Bid"
        "javascript:void(0)"
      when "Claim"
        "javascript:void(0)"
      when "Message"
        user_messages_url(user_id: notifier.user_id, notification_id: notification.id)
    end
  end

  def verify_ajax_call( notification )
    notification.notifier_type == "Message" ? true : false
  end
end
