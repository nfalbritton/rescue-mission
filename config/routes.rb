Rails.application.routes.draw do
  devise_for :users
  resources :questions do
    resources :answers, only: [:index, :new, :create]

    root'questions#index'
  end
end
