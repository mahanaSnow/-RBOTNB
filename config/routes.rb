Rails.application.routes.draw do
  root to: "pages#home"

  resources :bots

  resources :rentals, only: [:create, :index] do
    member do
      patch 'accept'
      patch 'decline'
    end
  end

  devise_for :users
end
