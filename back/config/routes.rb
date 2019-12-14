Rails.application.routes.draw do
  #jwtトークン取得
  post 'user_token' => 'user_token#create'

  namespace :api do
    namespace :v1 do
      resources :posts
      resources :admin_posts
      resources :admin_categories
      get '/login' => 'auth#login'
      post '/login' => 'auth#create'
      get '/logout' => 'auth#logout'
    end
  end

end
