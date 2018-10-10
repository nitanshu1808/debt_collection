class Lawyer < User
  ####################################################################################
  #associations
  with_options dependent: :destroy do |assoc|
    assoc.has_many :work_experiences
  end
  ####################################################################################
end
