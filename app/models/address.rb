class Address < ApplicationRecord
  ################################################################################
  #validations
  validates :name, :city, :county, :postal_code,
              :user_id, presence: true
  ################################################################################
  #associations
  belongs_to :user
end
