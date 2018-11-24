module Business::ClaimsHelper
  def verify_status(status)
    status == "Active" && "Deactive" || "Active"
  end

  def claim_header
    I18n.t("app.claim_identifier") + " # " + @claim.identifier
  end
end
