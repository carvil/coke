Coke::Application.routes.draw do
  resources :tweets, only: [:index]
  get :load, controller: :tweets, action: :load

  root :to => 'tweets#index'
end
