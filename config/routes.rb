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

		resources :lectures do
			resources :lecture_links do
				collection do
					put :sort
				end
			end
			resources :lecture_questions do
			end

			collection do
				put :sort
			end

			member do
				get :quiz
				post :grade
			end
		end
	end
	resources :seminars do
		collection do
			get :mine
			get :enrolled 
		end
	end

	root :to => "home#index"
end
