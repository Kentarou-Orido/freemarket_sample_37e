Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root 'items#index'
  resource :users, only: [:show] do
    resource :profile,:identification,:listing, only: [:show]
    resources :cards, only: [:index, :new]
    resources :addresses, only: [:new, :create]
  end

  resources :logouts, only: [:show]
  resource :sell, only: [:show, :create]
  resources :items, only: [:index, :show] do
    collection do
      get 'purchase'
      post 'completed_purchase'
    end
  end
  resources :signups, only: [:index]
end
