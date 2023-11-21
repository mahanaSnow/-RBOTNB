Rails.application.routes.draw do
  root to: "pages#home"

  resources :bots

  # Routes for Rentals
  resources :rentals, only: [:create, :index] do
    member do
      patch 'accept'
      patch 'decline'
    end
  end

  # Devise routes
  devise_for :users
end
