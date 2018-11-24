class Business::ClaimsController < BusinessController

  before_action :find_claim, only: [:update, :show]

  def index
    if params["status"].present?
      @claims = @business.claims.joins(:debtor).includes(:collection_area, :bids).where(status: params["status"])
    elsif params["collection_area_id"].present?
      @claims = @business.claims.joins(:debtor).includes(:collection_area, :bids).where("claims.collection_area_id = ?", params["collection_area_id"])
    else
      @claims = @business.claims.joins(:debtor).includes(:collection_area, :bids)
    end
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

  def show
    @debtor = @claim.debtor
    render 'shared/claim_detail'
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

  def find_claim
    @claim = Claim.find_by(id: params["id"])
  end
end
