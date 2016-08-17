Rails.application.routes.draw do
	resources :users

	get "/sessions/new" => "sessions#new"
	post "/login" => "sessions#login"
	delete "/sessions" => "sessions#logout"
	get "/sessions"=> "users#show"

	get "/secrets" => "secrets#index"
	post "/secrets" =>"secrets#create"
	delete "/secrets/:id" =>"secrets#destroy"

	post "/likes" => "likes#create"
	delete "/likes/:id" => "likes#destroy"
	
end
