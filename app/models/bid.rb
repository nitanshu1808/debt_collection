class Bid < ApplicationRecord
  #constants
  FEE_TYPE =        %w(Hourly Flat Contingency)
  STATUS_OPTIONS =  %w(pending denied approved cancelled)
  ################################################################################
  #associations
  belongs_to          :lawyer
  belongs_to          :claim, counter_cache: true
  has_many_attached   :attachments
  has_many            :notifications, :as => :notifier
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

  def notify_business(claim, lawyer)
    notification = self.notifications.build({
                  user_id:              claim.business.id,
                  notfication_message:  I18n.t("app.bid_on_claim", val: claim.identifier, name: lawyer.user_name.titleize),
                  })
    notification.save
  end
  #private methods
  private
  
  def check_bid_amount
    errors.add(:base, I18n.t("bid.invalid_amount")) if amount > (claim_amount/2)
  end
end
