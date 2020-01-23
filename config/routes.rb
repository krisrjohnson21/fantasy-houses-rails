Rails.application.routes.draw do
  root 'houses#index'

  resources :houses, only: [:index, :show, :new, :create, :edit, :update] do
    resources :members, only: [:new, :create]
  end
end
