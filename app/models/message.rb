class Message < ApplicationRecord
  #associations
  belongs_to :user
  belongs_to :conversation
  #################################################################################################
  #validations
  validates :body, :conversation_id, :user_id, presence: true
  #################################################################################################
end
