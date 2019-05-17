Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tutorials, only:[:show, :index]
      resources :videos, only:[:show]
    end
  end

  root 'welcome#index'
  get 'tags/:tag', to: 'welcome#index', as: :tag
  get '/register', to: 'users#new'

  namespace :admin do
    get "/dashboard", to: "dashboard#show"
    resources :tutorials, only: [:create, :edit, :update, :destroy, :new] do
      resources :videos, only: [:create]
    end
    resources :videos, only: [:edit, :update, :destroy]

    namespace :api do
      namespace :v1 do
        put "tutorial_sequencer/:tutorial_id", to: "tutorial_sequencer#update"
      end
    end
  end

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  get 'auth/github', as: "github_login"
  get '/auth/:provider/callback', to: "sessions#update"

  get '/dashboard', to: "users#show"
  get '/about', to: 'about#show'
  get '/get_started', to: 'get_started#show'
  post '/friendship', to: 'friendships#create'

  get '/invite', to: 'invite#new', as: :new_invite
  post '/invite', to: 'invite#create'

  resources :users, only: [:new, :create, :update, :edit]

  resources :tutorials, only: [:show, :index]

  resources :user_videos, only:[:create, :destroy]
  get '/bookmarks', to: "user_videos#error", as: :bookmark_error

  get '/confirm', to: 'confirm#create'
end
