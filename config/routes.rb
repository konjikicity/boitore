Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'top#index'
  namespace :api do
    resources :modes, only: %i[index] do
      resources :selects, only: %i[index show]
    end
  end
  namespace :admin do
    root to: 'dashboards#index'
    resources :modes, only: %i[index edit update show destroy]
    resources :sentences, only: %i[index edit update show destroy]
  end
  get '*path', to: 'top#index'
end
