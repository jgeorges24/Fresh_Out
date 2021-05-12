Rails.application.routes.draw do
  
  #handles the registration of a user

    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'

    #handles the seessions log in
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'

    #get '/tapes/user', to: 'user#show'

    #handles log out

    delete '/logout', to: "sessions#logout"

    #ominauth
    get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

    #homepage static element/page
    root('tapes#home')

    #search
    get '/search', to: 'tapes#search', as: 'search'

    get '/recent_tape', to: 'tapes#recent_tape'

    get '/user', to: 'users#show'

    resources :users 

    resources :tapes do 
      resources :opinions#, shallow: true
      
    end

    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
