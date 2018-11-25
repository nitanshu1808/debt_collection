module ProfileCompletion
  extend ActiveSupport::Concern

  included do
    before_action :verify_profile_completion, except: [:complete_profile, :update]
  end

  private
  def user_params
    params.require(:user).permit(:profile_image, :id, :email,
                  :user_name, :name, :contact_number, :description,
                  :profile_completed, collection_area_ids: [],
                  address_attributes: [:id, :name, :city, :postal_code, :county])
  end

  def find_lawyer
    @lawyer = Lawyer.find_by(id: params["id"] || params["legal_professional_id"])
  end

  def lawyer_details
    @educations       =  @lawyer.educations
    @work_experience  =  @lawyer.work_experiences
    @collection_areas =  @lawyer.collection_areas
    @address          =  @lawyer.address
  end

  def find_business
    @business = Business.find_by(id: params["id"] || params["business_id"])
  end

  def verify_profile_completion
    unless current_user.profile_completed?
      verify_user_profile_completion_path
    end
  end

end
