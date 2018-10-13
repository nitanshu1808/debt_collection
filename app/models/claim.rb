class Claim < ApplicationRecord
  #associations
  belongs_to :business
  belongs_to :collection_area
  has_many_attached :documents
  ###########################################################################
  #validations
  validates :amount, :claim_number, :pending_since, presence: true
  ###########################################################################
end
