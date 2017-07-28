Rails.application.routes.draw do
  resources :meetups
  root 'meetups#index'
  #root "welcome#index"
end
