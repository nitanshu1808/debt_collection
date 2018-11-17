module ProfileCompletion
  extend ActiveSupport::Concern

  private
  def user_params
    params.require(:user).permit(:profile_image, :id, :email, :user_name, :name, :contact_number, :description)
  end

  def profile_completion_error_msg
    @lawyer.valid? ? @lawyer.profile_completion_error : I18n.t("error.complete_profile")
  end

  def find_lawyer
    @lawyer = Lawyer.find_by(id: params["id"] || params["legal_professional_id"])
  end
end