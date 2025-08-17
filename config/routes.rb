Rails.application.routes.draw do
  get "maintenance_settings/show"
  devise_for :users, controllers: { sessions: "users/sessions", passwords: "users/passwords", registrations: "users/registrations", confirmations: "users/confirmations" }

  resource :dashboards, only: %i[show]
  resources :companies do
    resources :orders do
      patch :cancel, on: :member
    end
  end

  resources :cars do
    resource :maintenance_settings, only: [ :show, :update ]
    resources :car_maintenances do
      collection do
        get :export_pdf
      end
      resources :history_images do
      end
    end
    resources :car_fuelings
    resources :device_loggers do
      resources :device_logs
    end
  end

  namespace :api do
    namespace :v1 do
      resources :cars, only: [ :index ]
      resources :hotswitch_logs, only: [ :create ]
    end
  end

  resource :api_keys do
  end

  resources :car_shops
  resource :api_key, only: [ :new, :create ]

  namespace :admin do
    resource :dashboards, only: %i[show]
    resources :users, except: [ :show ]
    resources :car_brands
    resources :car_models
    resources :cars
    resources :car_shops do
      member do
        patch :approve
        patch :pending
      end
    end
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
  get "/admin/users", to: "admin/users#index"
  post "/webhooks/midtrans", to: "webhooks#midtrans"
  root "welcome#index"
  get "/public/car_shops/:id/:name", to: "public/car_shops#show"
  get "/public/car_shops", to: "public/car_shops#index"
  get "/public/car_models/:id/:name", to: "public/car_models#show"
  get "/public/car_models", to: "public/car_models#index"
end
