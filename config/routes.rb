Coke::Application.routes.draw do
  resources :tweets, only: [:index]
  get :load, controller: :tweets, action: :load
  get "tweets/:user_handle", controller: :tweets, action: :user, as: :user

  root :to => 'tweets#index'
end
