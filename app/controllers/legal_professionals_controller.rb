class LegalProfessionalsController < ApplicationController
  include ProfileCompletion
  #This module support for profile completion of legal professionals and Business

  # before_action :verify_user_profile_completion_path, only:  :complete_profile
  before_action :find_lawyer, except:  :complete_profile

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
end
 