Rails.application.routes.draw do
  # resources :images
  resources :links, only: [:index, :show, :update, :create, :destroy]
  resources :githubs, only: [:index, :show, :update, :create, :destroy]
  resources :admins, only: [:index]
  resources :sessions, only: [:create, :index, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/", to: "pages#index"
  root "pages#index"
  get "/contact", to: "pages#index", via: :all
  get "/404", to: "pages#not_found"
  delete "/sessions", to: "sessions#destroy"
  # match "*path" => "pages#index", via: :all
end
