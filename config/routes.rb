Rails.application.routes.draw do
  resources :teas, only: [:index, :show, :create, :update, :destroy]
  resources :customers do
    resources :subscriptions, only: [:create, :destroy, :index]
  end
end

