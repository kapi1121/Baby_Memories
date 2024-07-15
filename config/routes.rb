Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  root to: 'home#index'

  resources :babies do
    resources :feedings
    resources :diaper_changes
    resources :diaries
  end

  resources :advices, only: [:index, :show]
end
