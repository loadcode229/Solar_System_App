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
  # get '/planets' => 'planets#index'
  # get '/planet/:id' => 'planets#show'
  # get '/new_planet' => 'planets#new'
  # post '/new_planet' => 'planets#create'
  # get '/edit_planet' => 'planets#edit'
  # patch '/planet' => 'planets#update'
  # delete '/destroy_planet' => 'planets#destroy'

  #moons
  # get '/planet_moons' => 'moons#index'
  # get '/planet_moon' => 'moons#show'
  # get '/new_planet_moon' => 'moons#new'
  # post '/new_planet_moon' => 'moons#create'
  # get '/edit_planet_moon' => 'moons#edit'
  # patch '/planet_moon' => 'moons#update'
  # delete '/destroy_planet_moon' => 'moons#destroy'


  resources :moons, controller: "planet_moons"
  resources :users do
    resources :planets, only: [:index]
  end

  resources :planets do
    resources :moons, only: [:index], controller: "planet_moons"
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end