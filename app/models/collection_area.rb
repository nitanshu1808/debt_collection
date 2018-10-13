class CollectionArea < ApplicationRecord
  #association
  has_and_belongs_to_many :lawyers, :class_name => "Lawyer", :association_foreign_key => "user_id"
  has_many                :claims
  ########################################################################################
  #validations
  validates :name, presence: true, uniqueness: true
  ########################################################################################
end
