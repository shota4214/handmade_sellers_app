Rails.application.routes.draw do
  devise_for :users
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'top#index'
  resources :users, only: [:show]
  resources :shops
end
