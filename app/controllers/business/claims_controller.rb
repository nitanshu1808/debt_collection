class Business::ClaimsController < ApplicationController
  before_action :find_business

  def index
    @claims = @business.claims
  end

  def new
    @claim  = @business.claims.build
    build_association
  end

  def create
  end

  private
  def find_business
    @business = Business.find_by(id: params["business_id"])
  end

  def claim_params
    params.require(:claim).permit(:business_id, :collection_area_id,
              :amount, :identifier, :additional_desciption,
              debtor_attributes: [:county, :name,
              :address, :city, :postal_code, :claim_id])
  end

  def build_association
    @claim.debtor || @claim.build_debtor
  end
end
