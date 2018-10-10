class WorkExperience < ApplicationRecord
	####################################################################################	
	#associations
	belongs_to :lawyer
	#validations
  validates :company_name, :designation, :from_date, presence: true
  validates :to_date, presence: true, unless: :currently_working?
  validate  :from_to_date_val, if: Proc.new { |a| !(a.currently_working?) && a.to_date && a.from_date }
  ####################################################################################
  #private methods
  private
  def from_to_date_val
    errors.add(:base, I18n.t("work_experience.invalid_to_date")) if (from_date > to_date)
  end
end
