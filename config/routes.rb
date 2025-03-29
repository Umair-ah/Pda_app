Rails.application.routes.draw do
  devise_for :users
  resources :details, only: %i[create new show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "details#new"
  get "/reviewers/index", to: "reviewers#index"
  post "/reviewers/approve", to: "reviewers#approve", as: :approve

  get "/admins/index", to: "admins#index"
  post "/admins/export", to: "admins#export", as: :export
  post "/admins/export_all", to: "admins#export_all", as: :export_all



  

end
