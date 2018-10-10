class Provider < ApplicationRecord
  #validations
  validates :uid, :provider_name, :user_id, :token, presence: true
  #################################################################################################
  #associations
  belongs_to :user, inverse_of: :provider
  #################################################################################################
end
