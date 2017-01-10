Rails.application.routes.draw do
	get '/home' => 'students#index'
	post '/login' => 'students#create'
	delete '/logout' => 'students#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
