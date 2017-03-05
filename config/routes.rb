Rails.application.routes.draw do

  root 'questions#index'

  devise_for :users, controllers: {
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :questions do
    resources :answers
  end

  resources :users, only: [:index, :show] do
    resources :favorites, only: [:index]
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
