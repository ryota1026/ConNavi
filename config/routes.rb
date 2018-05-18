Rails.application.routes.draw do

  get "login" => "users#login_form"
  post "logout" => "users#logout"
  post "login" => "users#login"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  post "users/find" => "users#find"
  get "users/find" => "users#find"
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  get "users/:id/likes" => "users#likes"
  get "users/:id/reply" => "users#reply"

  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/creates" => "likes#creates"
  post "likes/:post_id/destroy" => "likes#destroy"
  post "likes/:post_id/destroies" => "likes#destroies"

  post "reply/:reply_id/create" => "reply#create"
  post "reply/:reply_id/destroy" => "reply#destroy"

  get "posts" => "posts#index"
  get "posts/index" => "posts#index"
  get "post/index/" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/search" => "posts#search"
  get "posts/search" => "posts#search"
  get "posts/price/:product_price" => "posts#price"
  get "posts/:id" => "posts#show"
  get "posts/:id/show_noimage" => "posts#show_noimage"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  get "stores/index" => "stores#index"
  get "stores/:id" => "stores#show"

  get "/" => "home#top"
  get "about" => "home#about"
  get "terms" => "home#terms"
  get "owner" => "home#owner"
  get "help" => "home#help"

  resource :categories
  resource :stores

end