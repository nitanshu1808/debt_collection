class Business::ClaimsController < BusinessController
  include ClaimInfo

  def index
    fetch_business_claims(false)
  end

  def request_for_proposals
    fetch_business_claims(true)
    render "index" if request.format.to_s == "text/javascript"
  end

  def new
    @claim  = @business.claims.build
    build_association
  end

  def create
    @claim = @business.claims.build(claim_params)
    if @claim.save
      redirect_to business_claims_path(@business), notice: I18n.t("create.claim")
    end
  end

  def update
    @claim = Claim.find_by(id: params["id"])
    update_status if params["status"].present?
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

  def update_status
    if @claim.update_columns(status: params["status"]) && @claim.notify_lawyers
      render json: {data: @claim}, status: 200 and return
    else
      render json: {error: @claim.errors.full_messages}, status: 404 and return
    end
  end

  def fetch_business_claims(is_rfp)
    if params["status"].present?
      @claims = @business.associated_claims(is_rfp).where(status: params["status"])
    elsif params["collection_area_id"].present?
      @claims = @business.associated_claims(is_rfp).where("claims.collection_area_id = ?", params["collection_area_id"])
    else
      @claims = @business.associated_claims(is_rfp)
    end
  end
end
