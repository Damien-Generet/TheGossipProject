Rails.application.routes.draw do
  get '/gossips/:gossip_id', to: 'dynamic_pages#gossip_page', as: 'gossips'
  get '/home/:first_name', to: 'dynamic_pages#home'
  get '/profile/:user_id', to: 'dynamic_pages#user_page', as: 'profile'
  get '/new_gossip', to: 'static_pages#new_gossip'
  post '/new_gossip', to: 'static_pages#new_gossip_post'
  get '/index_gossips', to: 'static_pages#index_gossips'
  get '/home', to: 'static_pages#home'
  
  get '/contact', to: 'static_pages#contact'
  get '/team', to: 'static_pages#team'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
