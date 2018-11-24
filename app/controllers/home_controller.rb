class HomeController < ApplicationController
  before_action :identify_user_path, if: :current_user

  def index
  end

  def business_registration
    @user = Business.new
    render 'registration'
  end

  def legal_professional_registration
    @user = Lawyer.new
    render 'registration'
  end
end
