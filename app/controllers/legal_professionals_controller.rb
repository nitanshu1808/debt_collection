class LegalProfessionalsController < ApplicationController

  before_action :check_user

  def complete_profile
    @legal_professional = current_user
  end

  private
  def check_user
    redirect_to business_complete_profile_path, notice: I18n.t("app.unauthorize") unless current_user.is_lawyer?
  end

end
