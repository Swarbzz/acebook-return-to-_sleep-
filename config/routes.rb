Rails.application.routes.draw do
  resources :timeline_posts
  resources :profilepictures
  resources :albums
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "welcome#index"
  get "/posts", to: "posts#index"
  get "/posts/new", to: "posts#new"
  post "/addpost", to: "posts#create"
    # User Routes
  get '/users', to: "users#index"
  get '/sign-up', to: 'users#new_user'
  post '/users', to: 'users#create_a_user'
  post '/authentication', to: 'users#auth'
  get '/log-out', to: 'users#logout'
  get '/users/:id/edit', to: 'users#edit'
  patch '/users', to: 'users#update_user'
  delete '/users/:id', to: 'users#destroy_user'
  get '/users/:id/timeline', to: 'users#timeline'
  # Homepage routes
  get '/home', to: 'homepage#index'
  post '/home/:id/comments', to: 'comments#create'
  
  resources :posts do
    resources :likes
    resources :dislikes
  end
  resources :users do
    get :images
    member do
      get :following, :followers
    end
  end
  resources :relationships


end
