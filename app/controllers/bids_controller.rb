class BidsController < ApplicationController
  before_action :find_claim

  def new
    @bid = @claim.bids.build(lawyer_id: current_user.id)
  end

  def create
    @bid = @claim.bids.build(bid_params)
    if @bid.save
      @bid.notify_business(@claim, current_user)
      redirect_to claim_path(@claim), notice: I18n.t("app.bid_success")
    end
  end

  private
  def find_claim
    @claim = Claim.find_by(id: params["claim_id"])
  end

  def bid_params
    params.require(:bid).permit(:lawyer_id, :claim_id, :amount, :status, :fee_type, :terms_of_service)
  end
end
