class HomeController < ApplicationController
  before_action :redirect_user_to_path, only: [:business_registration, :legal_professional_registration], if: :current_user

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
