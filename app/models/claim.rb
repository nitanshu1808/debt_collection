class Claim < ApplicationRecord
  #constants
  STATUS_OPTIONS = %w(deactive active closed)
  ###########################################################################
  #associations
  belongs_to        :business
  belongs_to        :collection_area
  has_many_attached :documents
  has_many          :bids
  has_many          :request_for_proposals
  has_one           :debtor
  ###########################################################################
  #validations
  validates :amount, :identifier, :pending_since, :status,
            :county, presence: true
  validates :status, :inclusion => {:in => STATUS_OPTIONS,
    message: I18n.t("app.invalid_status", %{value}) }
  validates :amount, numericality: { greater_than_or_equal_to: 100,
    only_integer: true, message: I18n.t("app.invalid_amount") }
  ###########################################################################
  #enum declaration
  enum status: STATUS_OPTIONS
  accepts_nested_attributes_for :debtor
end
