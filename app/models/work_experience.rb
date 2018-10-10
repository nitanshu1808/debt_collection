class WorkExperience < ApplicationRecord
  #module for date comparison
  include DateComparison
  ####################################################################################
  #associations
  belongs_to :lawyer
  #validations
  validates :company_name, :designation, :from_date, presence: true
  validates :to_date, presence: true, unless: :currently_working?
  validate  :from_to_date_val_comparison, if: Proc.new { |a| !(a.currently_working?) && a.to_date && a.from_date }
  ####################################################################################
end
