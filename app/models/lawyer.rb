class Lawyer < User
  ####################################################################################
  #associations
  with_options dependent: :destroy do |assoc|
    assoc.has_many :work_experiences
    assoc.has_many :educations
    assoc.has_and_belongs_to_many :collection_areas, foreign_key: 'user_id'
  end
  ####################################################################################
end
