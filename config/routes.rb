Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", omniauth_callbacks: "users/omniauth_callbacks" }
  root 'items#index'

  resources :users, only: [:show] do
    resources :profile, :identification, :listing, only: [:index]
    resources :cards, only: [:index, :new]
    resources :addresses, only: [:new, :create]
  end

  resources :logouts, only: [:show]
  resources :sells, only: [:index, :create, :edit, :update]
  resources :items, only: [:index, :show, :edit, :destroy] do
    collection do
      get 'purchase'
      post 'completed_purchase'
    end
  end
  resources :signups, only: [:index]
end
