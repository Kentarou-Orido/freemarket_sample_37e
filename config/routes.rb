Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root 'items#index'

  resources :users, only: [:show] do
<<<<<<< HEAD
    resources :profile, :identification, only: [:show]
=======
    resources :profile, :identification, only: [:index]
>>>>>>> a88bef1f677b0e8cffdd405ffd5be7f27ecfbdf7
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
