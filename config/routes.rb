Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] do
    resources :profile, :identification, only: [:show]
    resources :cards, only: [:index, :new]
    resources :addresses, only: [:new, :create]
  end

  resources :logouts, :sell, only: [:show, :create]
  resources :items, only: [:index, :show] do
    collection do
      get 'purchase'
      post 'completed_purchase'
    end
  end
  resources :signups, only: [:index]
end
