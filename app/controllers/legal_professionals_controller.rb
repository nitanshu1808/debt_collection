class LegalProfessionalsController < ApplicationController
  include ProfileCompletion
  #This module support for profile completion of legal professionals and Business

  before_action :find_lawyer, except:  [:complete_profile, :index]
  before_action :verify_user, only:    [:update]

  def complete_profile
    @lawyer = current_user
    @lawyer.collection_areas.build
    @lawyer.address || @lawyer.build_address
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

  def edit
    render 'complete_profile'
  end

  def index
    if params["collection_area_id"].present?
      @legal_professionals = Lawyer.completed_profiles.where("collection_areas.id =?", params["collection_area_id"])
    else
      @legal_professionals = Lawyer.completed_profiles.uniq
    end
  end

  private
  def verify_user
    verify_user_profile_completion_path if current_user.is_business?
  end
end
