Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :meetups
  root 'meetups#index'
  #root "welcome#index"
end
