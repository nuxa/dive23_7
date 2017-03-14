Rails.application.routes.draw do

  root 'questions#index'
  get 'ranks' => 'ranks#index'

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

  resources :tag

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
