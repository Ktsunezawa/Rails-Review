Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users, except: [:new, :create, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get 'relationships/followings' => 'relationships#followings', as: 'followings'
    get 'relationships/followers' => 'relationships#followers', as: 'followers'
  end
  resources :books, except: [:new] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
