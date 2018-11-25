class BusinessController < ApplicationController
  include ProfileCompletion
  #This module support for profile completion of legal professionals and Business
  before_action :find_business, except:  :complete_profile
  before_action :verify_user, except: :show

  def complete_profile
    @business = current_user
    @business.address || @business.build_address
  end

  def update
    if @business.update_attributes(user_params)
      redirect_to business_claims_path(@business)
    else
      flash.now[:error] = I18n.t("error.complete_profile")
      render 'complete_profile'
    end
  end

  def show
    @address = @business.address
  end

  private

  def verify_user
    verify_user_profile_completion_path if current_user.is_lawyer?
  end
end
