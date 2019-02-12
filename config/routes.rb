Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :users, only: [:show] do
    resource :profile,:identification, only: [:show]
    resources :cards, only: [:index, :new]
  end
  resource :logout,:sell, only: [:show]
  resource :items, only: [:show, :index, :buy]
  resource :signups, logins: [:show]
end
