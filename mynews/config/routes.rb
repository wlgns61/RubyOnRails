Rails.application.routes.draw do
  get 'posts/content/' => 'posts#content'
  get 'posts/mycontent/' => 'posts#mycontent'
  get 'posts/update/' => 'posts#update'
  get 'posts/myhome/' => 'posts#myhome'
  get 'posts/category/' => 'posts#category'
  get 'sessions/new'

  devise_for :users
  root 'posts#index'
  resources :posts, except: [:show] do
    post "/like", to: "likes#like_toggle"
    resources :comments, only: [:create, :destroy]
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
