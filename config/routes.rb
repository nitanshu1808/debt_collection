Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations", :omniauth_callbacks => "users/omniauth_callbacks", :sessions => "users/sessions"}

  unauthenticated :user do
    root to: 'home#index' #declaring the root path for non authentic users
    get '/business_registration',               to: 'home#business_registration'
    get '/legal_professional_registration',     to: 'home#legal_professional_registration'
    get '/login',                               to: 'users/sessions#new'
  end

  authenticated :user do
    # root to: 'home#index' #declaring the root path for non authentic users
    get '/legal_professional_complete_profile', to: 'legal_professionals#complete_profile'
    get '/business_complete_profile',           to: 'business#complete_profile'

    resources :legal_professionals, only: :update
    resources :business,            only: :create
    resources :claims
  end

end
