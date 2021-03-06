class Message < ApplicationRecord
  #associations
  belongs_to :user
  belongs_to :conversation
  has_many   :notifications, :as => :notifier
  #################################################################################################
  #validations
  validates :body, :conversation_id, :user_id, presence: true
  #################################################################################################
  def notify_user(receiver)
    notification = self.notifications.build({
                    user_id:              receiver.id,
                    notfication_message:  I18n.t("app.new_message", val: self.user.user_name.titleize),
                  })
    notification.save
  end
end
