Rails.application.routes.draw do
  
#handles the registration of a user

   get '/signup', to: 'users#new'
   post '/signup', to: 'users#create'

  #handles the seessions log in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  #homepage static element/page
  root('tapes#home')


  resources :tapes do 
    resources :opinions #might make it a create and destroy only so add only: [:create, :edit]
  end

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
