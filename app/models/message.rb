class Message < ApplicationRecord
  #associations
  belongs_to :user
  belongs_to :conversation
  has_many   :notifications, :as => :notifier
  #################################################################################################
  #validations
  validates :body, :conversation_id, :user_id, presence: true
  #################################################################################################
  def notify_user(user)
    notification = self.notifications.build({
                    user_id:              user.id,
                    notfication_message:  I18n.t("app.new_message", val: user.user_name.titleize),
                  })
    notification.save
  end
end
