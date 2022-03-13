Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'top#index'
  namespace :api do
    resources :selects, only: %i[index show]
    resources :modes, only: %i[index]
  end
  get '*path', to: 'top#index'
end
