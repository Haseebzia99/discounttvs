Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :tvs


    require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

end
