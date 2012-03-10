Idlearning::Application.routes.draw do
  devise_for :users

  resources :courses
  resource :account

  root :to => "home#index"

end
