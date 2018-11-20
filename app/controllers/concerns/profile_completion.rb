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

  def profile_completion_error_msg
    @lawyer.valid? ? @lawyer.profile_completion_error : I18n.t("error.complete_profile")
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

  def verify_user_profile_completion_path
    if current_user.is_lawyer?
      url_hash = identify_lawyer_redirection_path
      redirect_to url_hash[:url], notice: url_hash[:msg]
    elsif current_user.is_business?
      url_hash = identify_business_redirection_path
      redirect_to url_hash[:url], notice: url_hash[:msg]
    end
  end

  def identify_lawyer_redirection_path
    if current_user.profile_completed?
      {url: claims_path}
    else
      {url: legal_professional_complete_profile_path, msg: profile_completion_error_msg}
    end
  end

  def identify_business_redirection_path
    if current_user.profile_completed?
      {url: business_claims_path}
    else
      {url: business_complete_profile_path, msg: I18n.t("error.incomplete_profile")}
    end
  end

  def verify_profile_completion
    unless current_user.profile_completed?
      verify_user_profile_completion_path
    end
  end

end
