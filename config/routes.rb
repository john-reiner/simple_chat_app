Rails.application.routes.draw do
  resources :chats do 
    resources :messages
  end
  root 'pages#home'
  post "/login", to: "sessions#login"
  get "/logout", to: "sessions#logout"
  resources :sessions
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
