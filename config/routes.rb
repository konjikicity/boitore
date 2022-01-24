Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'top#index'
  get '*path', to: 'top#index'
  namespace :api do
    resources :sentences, only: [:index]
  end
end
