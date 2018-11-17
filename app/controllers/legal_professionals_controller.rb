class LegalProfessionalsController < ApplicationController
  include ProfileCompletion
  #This module support for profile completion of legal professionals and Business

  before_action :check_user
  before_action :find_lawyer, only: :update

  def complete_profile
    @lawyer = current_user
  end

  def update
    if @lawyer.update_attributes(user_params) && @lawyer.profile_completed?
      redirect_to claims_path
    else
      flash.now[:error] = profile_completion_error_msg
      render 'complete_profile'
    end
  end

  private
  def check_user
    redirect_to business_complete_profile_path, notice: I18n.t("app.unauthorize") unless current_user.is_lawyer?
  end

end
