Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#home"
  resources :matchdays, only: :show do
    patch :update_predictions, on: :member
    resources :games, only: :show do
      resources :predictions, only: [:edit, :update]
    end
  end
  resources :users, only: :show do
    patch :algo, on: :member
  end
  resources :predictions, only: :create
  resources :clubs, only: :index
end
