Rails.application.routes.draw do


  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'pages#index'
  resources :items
  resources :categories

  get '/subcategories' => 'categories#sub_category'
  get ':category' => 'pages#show'


end
