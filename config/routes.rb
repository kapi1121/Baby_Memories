Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  root to: 'home#index'

  resources :babies do
    resources :feedings, only: [:new, :create, :index]
    resources :diaper_changes, only: [:new, :create, :index]
    resources :diaries, only: [:new, :create, :index, :show]
  end

  resources :advices, only: [:index, :show]
end
