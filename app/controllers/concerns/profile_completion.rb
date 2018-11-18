module ProfileCompletion
  extend ActiveSupport::Concern

  private
  def user_params
    params.require(:user).permit(:profile_image, :id, :email,
                  :user_name, :name, :contact_number, :description,
                  :profile_completed, collection_area_ids: [],
                  address_attributes: [:id, :name, :city, :postal_code, :county])
  end

  def profile_completion_error_msg
    @lawyer.valid? ? @lawyer.profile_completion_error : I18n.t("error.complete_profile")
  end

  def find_lawyer
    @lawyer = Lawyer.find_by(id: params["id"] || params["legal_professional_id"])
  end

  def render_template
    render "shared/#{params["action"]}"
  end

  def lawyer_details
    @educations       =  @lawyer.educations
    @work_experience  =  @lawyer.work_experiences
    @collection_areas =  @lawyer.collection_areas
    @address          =  @lawyer.address
  end

  def find_business
    @business = Business.find_by(id: params["id"])
  end

  def verify_user_profile_completion_path
    if current_user.is_lawyer?
      redirect_to identify_lawyer_redirection_path
    elsif current_user.is_business?
      redirect_to identify_business_redirection_path
    end
  end

  def identify_lawyer_redirection_path
    if current_user.profile_completed?
      claims_path
    else
      legal_professional_complete_profile_path
    end
  end

  def identify_business_redirection_path
    if current_user.profile_completed?
      claims_path
    else
      business_complete_profile_path
    end
  end

end
