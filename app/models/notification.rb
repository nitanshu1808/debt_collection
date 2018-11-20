class Notification < ApplicationRecord
  ###########################################################################
  #associations
  belongs_to :user, foreign_key: "user_id"
  belongs_to :notifier, polymorphic: true
  #validations
  validates :user_id, :notfication_message, :notifier_id, :notifier_type, presence: true
end
