Rails.application.routes.draw do
  #topページへのルート
  root to: 'top#index'
  
  #api認証、DBからデータを取得する用のルート
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', skip: [:password], controllers: {
        registrations: 'api/v1/auth/registrations'
      }
      resources :modes, only: %i[index] do
        resources :selects, only: %i[index show]
      end
      resources :play_results, only: %i[index create destroy]
    end
  end
  
  # 管理者用ルート
  namespace :admin do
    root to: 'dashboards#index'
    devise_for :user, skip: [:password, :registrations], controllers: {
      sessions: 'admin/user_sessions'
    } 
    resources :users
    resources :modes
    resources :sentences
  end
  # rails側のrouting error回避
  get '*path', to: 'top#index'
end
