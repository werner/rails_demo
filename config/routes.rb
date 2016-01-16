Rails.application.routes.draw do
  devise_for :users

  resources :movies, only: [:index]
  resources :seasons, only: [:index]
  resources :movies_and_seasons, only: [:index]
  resources :purchases, only: [:create]

end
