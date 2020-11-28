Rails.application.routes.draw do
  devise_for :users
  root to: "prototype#index"
  resources :prototype do
    resources :comments, only: :create
  end
  resources :users, only: :show  
end
