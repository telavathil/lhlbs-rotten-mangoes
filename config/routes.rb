Rails.application.routes.draw do

  namespace :admin do
    resources :users
  end

  resources :movies do
        resources :reviews, only: [:new, :create]
      end
  resources :actors, only: [:index,:new, :edit,:create, :show]
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  root to: 'movies#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
