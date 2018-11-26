Rails.application.routes.draw do
  root to: 'home#index'
  mount ActionCable.server => '/cable'
  devise_for :users, :controllers => {:registrations => "users/registrations", :omniauth_callbacks => "users/omniauth_callbacks", :sessions => "users/sessions"}

  unauthenticated :user do
    get '/business_registration',               to: 'home#business_registration'
    get '/legal_professional_registration',     to: 'home#legal_professional_registration'
    get '/login',                               to: 'users/sessions#new'
  end

  authenticated :user do
    get '/legal_professional_complete_profile', to: 'legal_professionals#complete_profile'
    get '/business_complete_profile',           to: 'business#complete_profile'

    resources :legal_professionals,             only: [:update, :show, :index] do
      resources :work_experience,               only: [:new, :create]
      resources :education,                     only: [:new, :create]
      resources :bids,                          only: [:index]
    end

    resources :business,                        only: [:update, :show] do
      scope module: 'business' do
        resources :claims,                      except: [:delete, :edit]
        get '/request_for_proposals',           to: 'claims#request_for_proposals'
      end
    end

    resources :claims,                          only: [:index, :show] do
      resources :bids,                          only: [:new,   :index,   :create,  :update] do
        member do
          get 'approve'
          get 'deny'
        end
      end
    end

    resources :users, shallow: true do
      resources :messages,                      only: [:index, :create]
    end

  end
end
