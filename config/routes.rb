Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "users/registrations", :omniauth_callbacks => "users/omniauth_callbacks", :sessions => "users/sessions"}


  unauthenticated :user do
    root to: 'home#index' #declaring the root path for non authentic users
  end

  authenticated :user do
    root to: 'home#feeds' #declaring the root path for authentic users
    get '/load_more', to: 'home#load_more'
  end

end
