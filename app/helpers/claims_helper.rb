module ClaimsHelper
  def check_val(val, checked_val)
    checked_val && val == checked_val || false
  end
end
