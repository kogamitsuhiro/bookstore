Rails.application.routes.draw do
  #jwtトークン取得
  post 'user_token' => 'user_token#create'

  namespace :api do
    namespace :v1 do
      resources :posts
      get '/login' => 'auth#login'
      post '/login' => 'auth#create'
      get '/logout' => 'auth#logout'
    end
  end

end
