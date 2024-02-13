Rails.application.routes.draw do
  get '/home', to: 'static_pages#home'
  get '/home/:first_name', to: 'dynamic_pages#home'
  get '/profile/:user_id', to: 'dynamic_pages#user_page', as: 'profile'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  resources :gossips

 
  get "up" => "rails/health#show", as: :rails_health_check

end


# gossips GET        /gossips(.:format)               gossips#index
# POST               /gossips(.:format)                gossips#create
# new_gossip GET     /gossips/new(.:format)            gossips#new
# edit_gossip GET    /gossips/:id/edit(.:format)         gossips#edit
# gossip GET         /gossips/:id(.:format)           gossips#show
# PATCH              /gossips/:id(.:format)         gossips#update
# PUT                /gossips/:id(.:format)           gossips#update
# DELETE             /gossips/:id(.:format)