Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users
  resources :booking_vip_customer_discounts
  resources :facilities
  resources :reviews
  resources :payments
  resources :booking_additional_services
  resources :additional_services
  resources :promotions
  resources :booking_discounts
  resources :special_requests
  resources :bookings
  resources :reservations
  resources :rooms
  resources :hotel_locations
  resources :room_types
  resources :vip_customer_benefits
  resources :customers
  devise_for :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
