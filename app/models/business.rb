class Business < User
  #associations
  has_many :claims
  #################################################################################
  def associated_claims(is_rfp)
    claims.joins(:debtor).includes(:collection_area, :bids).where("is_rfp = ?", is_rfp)
  end
end
