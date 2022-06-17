Rails.application.routes.draw do
  # topページへのルート
  root to: 'top#index'

  # コールバックページへの遷移
  get '/oauth/twitter/callback', to: 'callbacks#twitter'
  get '/oauth/google/callback', to: 'callbacks#google'
  # api認証、DBからデータを取得する用のルート
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', skip: [:password], controllers: {
        registrations: 'api/v1/auth/registrations',
        omniauth_callbacks: 'api/v1/auth/omniauth_callbacks'
      }
      resources :modes, only: %i[index] do
        resources :selects, only: %i[index show]
      end
      resources :play_results, only: %i[index create destroy]
    end
  end

  # 管理者用ルート
  devise_for :admins, skip: %i[registrations password], controllers: {
    sessions: 'admins/sessions'
  }
  namespace :admins do
    root to: 'dashboards#index'
    resources :users
    resources :modes
    resources :sentences
  end
  
  # 違うpathのURLの時topページへ遷移するルート
  get '*path', to: 'top#index'

end
