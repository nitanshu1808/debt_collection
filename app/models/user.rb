class User < ApplicationRecord
  # constants
  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\z/ 
  ##############################################################################
  # devise modules
  devise :database_authenticatable, :registerable,
         :validatable, :omniauthable
  ################################################################################
  # validations
  validates :email, :user_name, :name, presence: true
  validates :email, uniqueness: true
  validates :email, format: {with: VALID_EMAIL_REGEX }
  ################################################################################
  # associations
  with_options dependent: :destroy do |assoc|
    assoc.has_one :provider
    assoc.has_one :address
  end
  ################################################################################
end
