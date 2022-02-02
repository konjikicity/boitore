Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'top#index'
  namespace :api do
    resources :selects, only: [:index, :show]
  end
  get '*path', to: 'top#index'
end
