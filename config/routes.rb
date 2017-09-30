Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'project#landing'

  get '/conversations/main' => 'conversations#new', as: 'new_conservation'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/about' => 'project#about'


  resources :conversations, only: [:show, :create]
  resources :users, only: [:show, :create, :new]

end
