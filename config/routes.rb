Rails.application.routes.draw do
  devise_for :users
  root'questions#index'

  resources :questions do
    resources :answers, only: [:index, :new, :create]
  end
end
