class Education < ApplicationRecord
  #module for date comparison
  include DateComparison
  ####################################################################################  
  #associations
  belongs_to :lawyer
  #validations
  validates :field_of_study, :institution, :from_date, :to_date, presence: true
  validate  :from_to_date_val_comparison, if: Proc.new { |a| a.to_date && a.from_date }
end
