Rails.application.routes.draw do
  resources :pictures
  devise_for :users

  root to: 'pages#index'

  get '/pages/welcome', to: 'pages#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
