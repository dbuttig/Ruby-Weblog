Weblog::Application.routes.draw do
	
	root "welcome#index"
	
	resources :authors

	resources :posts do
		resources :comments
	end
end
