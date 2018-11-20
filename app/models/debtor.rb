class Debtor < ApplicationRecord
  ###########################################################################
  #association
  belongs_to :claim
  ###########################################################################
  #validations
  validates :name, :address, :county, :city, :postal_code, presence: true
  ###########################################################################
end
