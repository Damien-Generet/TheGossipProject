Rails.application.routes.draw do
  get '/home', to: 'static_pages#home'
  get '/home/:first_name', to: 'dynamic_pages#home'
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'
  resources :gossips
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]

  resources :gossips do
    resources :like_gossips, only: [:create, :destroy]
  end

  resources :gossips do
    resources :comments
  end
  
  get "up" => "rails/health#show", as: :rails_health_check

end


# gossips GET        /gossips(.:format)               gossips#index
# POST               /gossips(.:format)                gossips#create
# new_gossip GET     /gossips/new(.:format)            gossips#new
# edit_gossip GET    /gossips/:id/edit(.:format)         gossips#edit
# gossip GET         /gossips/:id(.:format)           gossips#show
# PATCH              /gossips/:id(.:format)         gossips#update
# PUT                /gossips/:id(.:format)           gossips#update
# DELETE             /gossips/:id(.:format)           gossips#destroy


# users GET         /users(.:format)             users#index
# POST              /users(.:format)             users#create
# new_user GET      /users/new(.:format)         users#new
# edit_user GET     /users/:id/edit(.:format)    users#edit
# user GET          /users/:id(.:format)         users#show
# PATCH             /users/:id(.:format)         users#update
# PUT               /users/:id(.:format)         users#update
# DELETE            /users/:id(.:format)         users#destroy

# cities GET        /cities(.:format)              cities#index
# POST              /cities(.:format)              cities#create
# new_city GET      /cities/new(.:format)          cities#new
# edit_city GET     /cities/:id/edit(.:format)     cities#edit
# city GET          /cities/:id(.:format)          cities#show
# PATCH             /cities/:id(.:format)          cities#update
# PUT               /cities/:id(.:format)          cities#update
# DELETE            /cities/:id(.:format)          cities#destroy

# gossip_comments GET       /gossips/:gossip_id/comments(.:format)                   comments#index
# POST                      /gossips/:gossip_id/comments(.:format)                   comments#create
# new_gossip_comment GET    /gossips/:gossip_id/comments/new(.:format)               comments#new
# edit_gossip_comment GET   /gossips/:gossip_id/comments/:id/edit(.:format)          comments#edit
# gossip_comment GET        /gossips/:gossip_id/comments/:id(.:format)               comments#show
# PATCH                     /gossips/:gossip_id/comments/:id(.:format)               comments#update
# PUT                       /gossips/:gossip_id/comments/:id(.:format)               comments#update
# DELETE                    /gossips/:gossip_id/comments/:id(.:format)               comments#destroy