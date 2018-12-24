class Notification < ApplicationRecord
  ###########################################################################
  #associations
  belongs_to :user, foreign_key: "user_id"
  belongs_to :notifier, polymorphic: true
  #validations
  validates :user_id, :notfication_message, :notifier_id, :notifier_type, presence: true
  #scope
  scope :unread_msgs, -> (user) {includes(:notifier).where("user_id = ? and is_read = ?", user.id, false).order(created_at: :desc)}

end
