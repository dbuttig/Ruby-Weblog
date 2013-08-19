Weblog::Application.routes.draw do

  root "welcome#index"

  resources :authors

  resource :session

  resources :posts do
    resources :comments
  end
end
