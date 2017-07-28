Rails.application.routes.draw do
  resources :meetups
  root 'meetup#index'
  #root "welcome#index"
end
