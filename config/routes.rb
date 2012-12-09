Coke::Application.routes.draw do
  resources :coke, only: [:index]

  root :to => 'coke#index'
end
