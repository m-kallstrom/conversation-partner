Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'project#landing'

  get '/conversations/main' => 'conversations#new', as: 'new_conservation'

  get '/conversations/reset' => 'conversations#destroy', as: 'reset_conversation'

  get  '/login'  => 'sessions#new'
  post '/login'  => 'sessions#create'
  get  '/logout' => 'sessions#destroy'
  get  '/about'  => 'project#about'

  resources :sentences, only: [:new, :create]
  resources :conversations, only: [:show, :create, :new, :destroy]
  resources :users, only: [:show, :create, :new]

end
