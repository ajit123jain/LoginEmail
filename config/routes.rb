Rails.application.routes.draw do
  resources :people
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :authors do
  	get "delete"
  end
  resources :posts

end
