Rails.application.routes.draw do
  root 'featured_drinks#index'
  devise_for :users

  resources :drinks, only: [:index, :new, :create, :destroy]
  resources :categories, only: [:index, :show] do
    resources :drinks, only: [:index, :show, :destroy]
  end
end
