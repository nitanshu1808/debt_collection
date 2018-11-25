class Bid < ApplicationRecord
  #constants
  FEE_TYPE =        %w(hourly_fee, flat_fee, contingency)
  STATUS_OPTIONS =  %w(pending denied approved cancelled)
  #Pending is initial state of bid, when lawyer makes a bid on claim,
  ################################################################################
  #associations
  belongs_to :lawyer
  belongs_to :claim, counter_cache: true
  has_many_attached :attachments
  ################################################################################
  #enum
  enum status:    STATUS_OPTIONS
  enum fee_type:  FEE_TYPE
  ################################################################################
  #validations
  validates :amount, :status, :fee_type, presence: true
  validates :status, :inclusion => {:in => STATUS_OPTIONS,
    message: I18n.t("app.invalid_status", %{value}) }
  validates :fee_type, :inclusion => {:in => FEE_TYPE,
  message: I18n.t("app.invalid_fee", %{value}) }
  ################################################################################
  #callbacks
  before_validation :check_bid_amount, if: :amount?
  #delegate
  delegate    :amount, to: :claim, prefix: true
  ################################################################################
  #private methods
  private
  
  def check_bid_amount
    errors.add(:base, I18n.t("bid.invalid_amount")) if amount > (claim_amount/2)
  end
end
