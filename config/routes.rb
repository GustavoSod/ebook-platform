Rails.application.routes.draw do
  resources :books
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get "up" => "rails/health#show", as: :rails_health_check

  authenticated :user do
    root 'books#index', as: :authenticated_root # Root for logged-in users
  end

  unauthenticated do
    root 'home#index', as: :unauthenticated_root # Root for non-logged-in users
  end
end
