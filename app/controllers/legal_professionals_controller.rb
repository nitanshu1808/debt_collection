class LegalProfessionalsController < ApplicationController

  before_action :check_user
  before_action :find_lawyer, only: :update

  def complete_profile
    @legal_professional = current_user
  end

  def update
    @lawyer.profile_image.attach(params[:profile_image])
  end

  private
  def check_user
    redirect_to business_complete_profile_path, notice: I18n.t("app.unauthorize") unless current_user.is_lawyer?
  end

  def user_params
    params.require(:lawyer).permit(:profile_image)
  end

  def find_lawyer
    @lawyer = Lawyer.find_by(id: params["id"])
  end

end
