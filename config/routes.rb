Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  devise_for :users, controllers: {
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users, only: [:index, :show]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
