class BidsController < ApplicationController
  before_action :find_claim
  before_action :find_bid, only: [:approve, :deny]
  before_action :mark_notification_as_read, only: :index

  def index
    @bids        = @claim.bids.includes(:lawyer).with_attached_document
    @is_approved = @bids.select{|bid| bid.status == "approved" }.present?
  end

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

  def approve
    @bid.approved!
    @claim.notify_lawyer_about_bid(@bid)
    denied_bids
    redirect_to claim_bids_path(@claim), notice: I18n.t("app.bid_approval")
  end

  def deny
    @bid.denied!
    @claim.notify_lawyer_about_bid(@bid)
    redirect_to claim_bids_path(@claim), notice: I18n.t("app.bid_denial")
  end

  private
  def find_claim
    @claim = Claim.find_by(id: params["claim_id"])
  end

  def find_bid
    @bid = Bid.find_by(id: params["id"])
  end

  def bid_params
    params.require(:bid).permit(:lawyer_id, :claim_id, :amount, :status, :fee_type, :terms_of_service, :document)
  end

  def denied_bids
    @bids =  @claim.bids.where("id NOT IN(?)", @bid.id)
    @bids.each do |bid|
      bid.denied!
      @claim.notify_lawyer_about_bid(bid)
    end
  end
end
