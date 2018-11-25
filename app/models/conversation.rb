class Conversation < ApplicationRecord
  ############################################################################
  #associations
  belongs_to :sender,   foreign_key: 'sender_id',   class_name: 'User'
  belongs_to :receiver, foreign_key: 'receiver_id', class_name: 'User'
  has_many   :messages,   dependent: :destroy
  ############################################################################
  #validations
  validates_uniqueness_of :sender_id, :scope => :receiver_id
  validate  :sender_receiver_uniqueness
  ############################################################################
  #scope
  scope :between, -> (sender_id, receiver_id) {where('(sender_id = ? and receiver_id = ?)
                      OR (receiver_id = ? and sender_id =?)',
                      sender_id, receiver_id, sender_id, receiver_id)}
  ############################################################################
  #private methods
  private
  def sender_receiver_uniqueness
    errors.add(:base, I18n.t("conversation.sndr_rcvr_unique")) if sender_id == receiver_id
  end
end
