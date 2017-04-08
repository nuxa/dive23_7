Rails.application.routes.draw do

  get 'tags/index'

  root 'questions#index'
  get 'ranks' => 'ranks#index'

  devise_for :users, controllers: {
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :questions do
    resources :answers do
      resources :contributes, only: [:create, :destroy]
    end
    resources :contributes, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show] do
    resources :favorites
  end

  resources :tag

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
