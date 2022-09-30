Rails.application.routes.draw do
  devise_for :users
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  root 'top#index'
  resources :users, only: %i[show]
  resources :shops do
    resources :assigns, only: %i[create destroy]
    resources :materials
    resources :units, only: %i[index new create destroy]
    resources :suppliers, only: %i[index new create destroy]
    member do
      post :change_owner
      get :top
    end
  end
end
