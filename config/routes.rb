Rails.application.routes.draw do
  
  resources :tapes do 
    resources :opinions #might make it a create and destroy only so add only: [:create, :edit]
  end

  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
