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
    resources :play_results, only: %i[index create]
  end
  namespace :admin do
    root to: 'dashboards#index'
    resources :modes
    resources :sentences
  end
  get '*path', to: 'top#index'
end
