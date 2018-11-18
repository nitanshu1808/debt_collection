class LegalProfessionalsController < ApplicationController
  include ProfileCompletion
  #This module support for profile completion of legal professionals and Business

  before_action :check_user
  before_action :find_lawyer, except: :complete_profile

  def complete_profile
    @lawyer = current_user
    @lawyer.collection_areas.build
  end

  def update
    if @lawyer.update_attributes(user_params) && @lawyer.profile_completed?
      redirect_to claims_path
    else
      flash.now[:error] = profile_completion_error_msg
      render 'complete_profile'
    end
  end

  def show
    lawyer_details
  end

  private
  def check_user
    redirect_to business_complete_profile_path, notice: I18n.t("app.unauthorize") unless current_user.is_lawyer?
  end

end
