class RequestForProposal < ApplicationRecord
  #associations
  belongs_to :lawyer
  belongs_to :claim
  ################################################################################
  #callbacks
  before_save :update_claim_rfp
  ################################################################################
  #private methods
  private 

  def update_claim_rfp
    self.claim.update_attributes(is_rfp: true)
  end

end
