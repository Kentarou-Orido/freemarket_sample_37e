Rails.application.routes.draw do
  devise_for :users
  root 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :users, only: [:show] do
    resource :profile, only: [:show]
  end
end
