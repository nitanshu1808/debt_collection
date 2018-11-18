class BusinessController < ApplicationController
  include ProfileCompletion
  #This module support for profile completion of legal professionals and Business
  before_action :find_business, except:  :complete_profile
  before_action :verify_user_profile_completion_path, except: :complete_profile

  def complete_profile
    @business = current_user
    @business.address || @business.build_address
  end

  def update
    if @business.update_attributes(user_params)
      redirect_to claims_path
    end
  end

  def show
    @address = @business.address
  end
end
