Weblog::Application.routes.draw do
	
	root "welcome#index"

	resources :posts do
		resources :comments
	end
end
