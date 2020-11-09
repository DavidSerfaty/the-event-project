
Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'covers/create'
  get 'statics_pages/index'
  root 'events#index'

  devise_for :users
  resources :users, only: [:show, :edit, :update]

  resources :events do
    resources :attendances
    resources :covers, only: [:create]
    resources :charges, only: [:new, :create]
  end

end
