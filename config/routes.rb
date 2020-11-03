Rails.application.routes.draw do

  devise_for :users
  root 'events#index'

  resources :attendances
  resources :events
  resources :users
end
