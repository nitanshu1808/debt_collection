class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :validatable, :omniauthable

  # validations
  validates :email, :user_name, :name, :address,
              :city, :county, :postal_code, presence: true
  validates :email, uniqueness: true
end
