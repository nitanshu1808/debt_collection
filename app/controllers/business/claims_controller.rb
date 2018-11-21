class Business::ClaimsController < BusinessController
  def index
    @claims = @business.claims.includes(:collection_area, :bids)
  end

  def new
    @claim  = @business.claims.build
    build_association
  end

  def create
    @claim = @business.claims.build(claim_params)
    if @claim.save && @claim.notify_lawyers
      redirect_to business_claims_path(@business), notice: I18n.t("create.claim")
    end
  end

  private
  def claim_params
    params.require(:claim).permit(:business_id, :collection_area_id,
              :amount, :identifier, :additional_desciption,
              :is_rfp, :pending_since, :county,
              debtor_attributes: [:county, :name,
              :address, :city, :postal_code, :claim_id])
  end

  def build_association
    @claim.debtor || @claim.build_debtor
  end
end
