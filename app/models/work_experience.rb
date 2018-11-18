class WorkExperience < ApplicationRecord
  #module for date comparison
  include DateComparison
  include LawyerProfile
  ####################################################################################
  #associations
  belongs_to :lawyer
  #validations
  validates :company_name, :designation, :from_date, presence: true
  validates :to_date, presence: true, unless: :currently_working?
  validate  :from_to_date_val_comparison, if: Proc.new { |a| !(a.currently_working?) && a.to_date && a.from_date }
  ####################################################################################
  #scope
  default_scope { order(created_at: :desc) }
  ####################################################################################
  #callbacks
  after_create :verify_user_profile_completion
end
