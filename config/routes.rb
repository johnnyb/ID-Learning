Idlearning::Application.routes.draw do
	devise_for :users

	resource :account

	resources :courses do
		collection do
			get :mine
		end
		member do 
			put :publish
			put :unpublish
		end

		resources :lectures
	end
	resources :seminars do
		collection do
			get :mine
			get :enrolled 
		end
	end

	root :to => "home#index"
end
