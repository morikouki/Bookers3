Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:index, :create, :edit, :update, :destroy]
  end
  resources :users do
  	resource :relationships, only: [:create, :destroy]
  	get 'follower' => 'relationships#follower'
  	get 'followed' => 'relationships#followed'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
