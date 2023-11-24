Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  match '/users/:id', to: 'users#show', via: 'get', as: 'profile'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "/about", to: "pages#about", as: :about

  resources "cars", only: [:index, :show, :new, :create, :destroy] do
    collection do
      get :user_cars
    end
    resources "bookings", only: [:create, :index,]
  end

  resources "bookings", only: [:destroy] do
    collection do
      get :user_bookings
    end
  end
end
