module DateComparison
  extend ActiveSupport::Concern

  #private methods
  private
  def from_to_date_val_comparison
    errors.add(:to_date, I18n.t("app.invalid_to_date")) if (from_date > to_date)
  end
end