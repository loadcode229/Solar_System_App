Rails.application.routes.draw do
  #root
  root "sessions#home"

  #signup
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #logout
  delete '/logout' => 'sessions#destroy'

  #planets
  get '/planets' => 'planets#index'
  get '/planet' => 'planets#show'
  get '/new_planet' => 'planets#new'
  post '/new_planet' => 'planets#create'
  get '/edit_planet' => 'planets#edit'
  patch '/planet' => 'planets#update'
  delete '/destroy_planet' => 'planets#destroy'

  resources :users do
    resources :planets
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
