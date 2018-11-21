class Claim < ApplicationRecord
  #constants
  STATUS_OPTIONS = %w(Deactive Active Closed)
  ###########################################################################
  #associations
  belongs_to        :business
  belongs_to        :collection_area
  has_many_attached :documents
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
  validates :amount, numericality: { greater_than_or_equal_to: 100,
    only_integer: true, message: I18n.t("app.invalid_amount") }
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
