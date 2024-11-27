Rails.application.routes.draw do
  # Home
  root "home#index"

  # Registrations
  resources :registrations, only: [ :new, :create ]
  get "register", to: "registrations#new"

  # Login
  resources :logins, only: [ :new, :create ]
  get "login", to: "logins#new"

  # Logout
  get "logout", to: "logins#logout"

  # Posts
  resources :posts
  get "posts", to: "posts#index"
  get "my-posts", to: "posts#my_posts"






  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
