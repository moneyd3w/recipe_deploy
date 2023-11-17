Rails.application.routes.draw do
  resources :ingredients

  # set home to root and set sidepages so you dont need /main/...
  root to: 'main#home'

  # main pages (for all logged in users)
  get 'home', to: 'main#home' # home_path for erb
  get 'add', to: 'ingredients#new'
  get 'view', to: 'ingredients#index'
  
  get '/search_youtube', to: 'ingredients#search_youtube', as: :search_youtube

  get 'surprise', to: 'main#surprise' 
  get 'randingredient', to: 'main#randingredient'

  # admin page (admin == true)
  get 'adminuser', to: 'admin#users'
  get 'adminingredient', to: 'admin#ingredients'
  delete 'admindeluser', to: 'admin#destroyu'
  delete 'admindelingredient', to: 'admin#destroyi'
  post 'adminsetingredient/:param2', to: 'admin#setingredient', as: 'adminsetingredient'

  # account management
  get 'signup', to: 'registration#new'
  post 'signup', to: 'registration#create'

  get 'signin', to: 'session#new'
  post 'signin', to: 'session#create'
  delete 'logout', to: 'session#destroy'
  get 'account', to: 'session#view'
  delete 'accountuser', to: 'session#destroyu'

  get 'post', to: 'recipes#new'
  post 'post', to: 'recipes#create'

  # ingredient
  get 'ingredientview', to: 'ingredients#index'

  # might change later to same as others

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
end
