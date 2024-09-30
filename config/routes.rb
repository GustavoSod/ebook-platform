Rails.application.routes.draw do
  resources :books
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  authenticated :user do
    root 'books#index', as: :authenticated_root # Root for logged-in users
  end

  unauthenticated do
    root 'home#index', as: :unauthenticated_root # Root for non-logged-in users
  end
end
