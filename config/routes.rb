Rails.application.routes.draw do
  # set home to root and set sidepages so you dont need /main/...
  root to: 'main#home'

  # main pages (for all logged in users)
  get 'home', to: 'main#home' # home_path for erb
  get 'add', to: 'recipes#new'
  get 'surprise', to: 'main#surprise' #TEST###############
  get 'view', to: 'main#view'

  # admin page (admin == true)
  get 'admin', to: 'admin#users'
  delete 'admin', to: 'admin#destroy'

  # account management
  get 'signup', to: 'registration#new'
  post 'signup', to: 'registration#create'

  get 'signin', to: 'session#new'
  post 'signin', to: 'session#create'
  delete 'logout', to: 'session#destroy'

  get 'post', to: 'recipes#new'
  post 'post', to: 'recipes#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end
