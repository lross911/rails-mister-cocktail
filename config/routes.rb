Rails.application.routes.draw do
   root to: "cocktails#index"
  resources :cocktails, only: [:index, :show, :new, :create, :destroy] do
    resources :doses, only: [:create, :new, :destroy]
    resources :reviews, only: [:create]
  end
  resources :doses, only: [:destroy]
end
