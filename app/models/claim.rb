class Claim < ApplicationRecord
  #constants
  STATUS_OPTIONS = %w(Deactive Active Closed)
  ###########################################################################
  #associations
  belongs_to        :business
  belongs_to        :collection_area
  has_one_attached  :document
  has_many          :bids
  has_many          :request_for_proposals
  has_one           :debtor
  has_many          :notifications, :as => :notifier
  ###########################################################################
  #validations
  validates :amount, :pending_since, :status, :additional_desciption,
            :county, presence: true
  validates :status, :inclusion => {:in => STATUS_OPTIONS,
    message: I18n.t("app.invalid_status", %{value}) }
  ###########################################################################
  #enum declaration
  enum status: STATUS_OPTIONS
  accepts_nested_attributes_for :debtor
  ###########################################################################
  #callbacks
  before_create :set_identifier
  ###########################################################################
  #delegate
  delegate :name, to: :collection_area, allow_nil: true, prefix: true
  #scope
  scope :valid_claims, -> { joins(:debtor, :collection_area).includes(:collection_area, :bids).where("claims.is_rfp = ? and claims.status = ?", false, 1) }

  def notify_lawyers
    lawyers = Lawyer.joins(:address).where("addresses.county = ?", self.county)
    lawyers.each do |lawyer|
      notification = self.notifications.build({
                    user_id:              lawyer.id,
                    notfication_message:  I18n.t("app.new_claim"),
                  })
      notification.save
    end
  end

  private
  def set_identifier
    self.identifier = "#{I18n.t("app.claim_keyword")}#{id}P#{Devise.friendly_token(6)}"
  end

end
