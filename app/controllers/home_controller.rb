class HomeController < ApplicationController
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
