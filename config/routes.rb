Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'top#index'
  namespace :api do
    resources :modes, only: %i[index] do
      resources :selects, only: %i[index show]
    end
    resources :play_results, only: %i[index create destroy]
  end
  namespace :admin do
    root to: 'dashboards#index'
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    resources :modes
    resources :sentences
    resources :users
  end
  get '*path', to: 'top#index'
end
