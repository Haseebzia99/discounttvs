Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :tvs
<<<<<<< HEAD
=======

>>>>>>> c836fa98ec667bcb2cb8d22f915f95e0f793d357
end
