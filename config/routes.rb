Rails.application.routes.draw do
  resources :questions
  devise_for :users
end
