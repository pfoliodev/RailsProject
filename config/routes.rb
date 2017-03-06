Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get 'categories/index'

  get 'categories/show'

  get 'categories/update'

  get 'categories/destroy'

  get 'categories/new'

  get 'categories/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home'

  get '/news', to: 'pages#news'

  get '/front', to: 'pages#front'

  get '/back', to: 'pages#back'

  get '/real', to: 'pages#real' 

  resources :posts
  resources :categories

end
