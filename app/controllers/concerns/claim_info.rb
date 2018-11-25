module ClaimInfo
  extend ActiveSupport::Concern

  def show
    @claim  = Claim.find_by(id: params["id"])
    @debtor = @claim.debtor
    @owner  = @claim.business
    render 'shared/claim'
  end
end