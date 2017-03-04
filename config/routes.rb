Rails.application.routes.draw do
  
  resources :users, only: [:index, :show] do
    resources :favorites, only: [:index]
  end

  devise_for :users, controllers: {
      registrations: 'users/registrations',
      omniauth_callbacks: 'users/omniauth_callbacks'
  }


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
