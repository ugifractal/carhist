Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions", passwords: "users/passwords", registrations: "users/registrations", confirmations: "users/confirmations" }

  resources :cars do
    resources :car_maintenances do
      collection do
        get :export_pdf
      end
      resources :history_images do
      end
    end
    resources :car_fuelings
  end

  namespace :api do
    namespace :v1 do
      resources :cars, only: [:index]
    end
  end

  resource :settings, only: %i[show]
  resources :car_shops
  resource :api_key, only: [ :new, :create ]

  namespace :admin do
    resource :dashboards, only: %i[show]
    resources :users, except: [ :show ]
    resources :car_brands
    resources :car_models
    resources :car_shops
  end

  get "welcome/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  get "/admin", to: "admin/dashboards#show"
  root "cars#index"
  get "/admin/users", to: "admin/users#index"
end
