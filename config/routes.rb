Rails.application.routes.draw do
	get '/students' => 'students#index'
	get '/students/:id/edit' => 'students#edit'
	patch 'students/:id' => 'students#update'
	get '/students/:id' => 'students#show'
	get '/login' => 'students#new'
	post '/create' => 'students#create'
	delete '/logout' => 'students#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
