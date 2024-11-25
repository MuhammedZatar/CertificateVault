Rails.application.routes.draw do
  # Authentication-specific routes
  authenticated :user do
    root to: "dashboard#index", as: :authenticated_root
  end

  unauthenticated do
    root to: "pages#home", as: :unauthenticated_root
  end

  # Devise routes for User authentication
  devise_for :users, skip: :all
  devise_scope :user do
    get    'sign_in',      to: 'devise/sessions#new', as: :new_user_session
    post   'sign_in',      to: 'devise/sessions#create', as: :user_session
    delete 'sign_out',     to: 'devise/sessions#destroy', as: :destroy_user_session
    get    'sign_up',      to: 'devise/registrations#new', as: :new_user_registration
    post   'users',        to: 'devise/registrations#create', as: :user_registration
    get    'edit',         to: 'devise/registrations#edit', as: :edit_user_registration
    # Password recovery routes
    get    'password/new', to: 'devise/passwords#new', as: :new_user_password
    post   'password',     to: 'devise/passwords#create', as: :user_password
    get    'password/edit',to: 'devise/passwords#edit', as: :edit_user_password
    patch  'password',     to: 'devise/passwords#update'
  end

  # Admin-specific routes
  namespace :admin do
    resources :certificates
  end

  # Developer-specific routes
  namespace :developer do
    resources :apps, only: [:index, :new, :create, :edit, :update]
  end  

  # API-specific routes
  namespace :api do
    namespace :v1 do
      resources :certificates, only: [:index, :create, :update, :destroy]
    end
  end

  # General routes
  get "dashboard", to: "dashboard#index"
  resources :certificates
  resources :users, only: [:index, :show, :edit, :update, :destroy]
end
