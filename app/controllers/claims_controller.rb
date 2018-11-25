class ClaimsController < ApplicationController
  include ClaimInfo

  def index
    if params["collection_area_id"]
      @claims = Claim.valid_claims.where("collection_areas.id = ?", params["collection_area_id"])
    else
      @claims = Claim.valid_claims
    end
    render "business/claims/index" if request.format.to_s == "text/javascript"
  end
end
