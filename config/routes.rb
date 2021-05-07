Rails.application.routes.draw do
  
  #handles the registration of a user

    get '/signup', to: 'users#new'
    post '/signup', to: 'users#create'

    #handles the seessions log in
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'


    #handles log out

    delete '/logout', to: "sessions#logout"


    #homepage static element/page
    root('tapes#home')


    resources :tapes do 
      resources :opinions, only: [:create, :edit, :delete]
    end

    resources :users
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
