module LegalProfessionalsHelper
  def is_currently_working(exprnc)
    exprnc.currently_working && I18n.t("app.present") || modify_date(exprnc.to_date)
  end
end
