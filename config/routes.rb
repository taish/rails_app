Rails.application.routes.draw do

  get 'register_words/index'

  get 'register_words/show'

  use_doorkeeper
  # for rails
  root to: redirect('/index.html')
  resources :users
  resources :sessions

  get 'register', to: 'users#new'
  get 'logout', to: 'sessions#destroy'
  get 'login', to: 'sessions#new'

  get '/auth/:provider/callback', to: 'sessions#callback'
  # post '/auth/:provider/callback', to: 'sessions#callback'

  # for api
  namespace :api do
    scope ':versions', module: 'versions' do
      resources :users
      resources :register_words, only: [:index, :show, :create, :destroy]
      resources :tweets, only: [:index, :show, :create, :destroy] do
        collection do
          get 'build_hatebus'
          delete 'destroy_done'
        end
      end
      resources :friends do
        collection do
          get 'friends_candidate'
        end
      end
      resources :twitter_users
    end

    scope 'p', module: 'private' do
      get 'setup', to: 'setup#setup_data'
    end
  end
end
