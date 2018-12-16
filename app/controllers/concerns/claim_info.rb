module ClaimInfo
  extend ActiveSupport::Concern

  def show
    @claim  = Claim.find_by(id: params["id"])
    @doc    = @claim.document
    @debtor = @claim.debtor
    @owner  = @claim.business
    render 'shared/claim'
  end
end