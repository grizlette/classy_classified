Rails.application.routes.draw do


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :items
  resources :categories

  get ':category' => 'pages#show'

  get '/subcategories' => 'categories#sub_category'

end
