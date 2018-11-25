class Lawyer < User
  ####################################################################################
  #associations
  with_options dependent: :destroy do |assoc|
    assoc.has_many :work_experiences
    assoc.has_many :educations
  end

  has_many :bids
  has_and_belongs_to_many :collection_areas, foreign_key: 'user_id'
  has_many :request_for_proposals
  ####################################################################################
  scope :completed_profiles, -> {joins(:collection_areas).where(profile_completed: true)}
  #instance methods
  def profile_completion_error
    message = ""

    if work_experiences.blank?
      message << I18n.t("app.work_experience")
    end

    if educations.blank?
      message << " and " if work_experiences.blank?
      message << I18n.t("app.education")
    end

    I18n.t("error.please_add", val: message)
  end

  def is_profile_completed?
    educations.present? && work_experiences.present?
  end
end
