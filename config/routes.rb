Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new] do
    resources :profile,:identification, only: [:show]
    resources :cards, only: [:index, :new]
    resources :addresses, only: [:new, :create]
  end

  resources :logouts,:sell, only: [:show]
  resources :items, only: [:index, :show] do
    collection do
      get 'purchase'
      post 'completed_purchase'
    end
  end
  resources :signups, :logins, only: [:index]
end
