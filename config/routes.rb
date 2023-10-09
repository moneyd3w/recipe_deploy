Rails.application.routes.draw do
  # set home to root and set sidepages so you dont need /main/...
  root to: 'main#home'

  get 'home', to: 'main#home' # home_path for erb
  get 'add', to: 'main#add'
  get 'surprise', to: 'main#surprise'
  get 'view', to: 'main#view'

  get 'login', to: 'main#login'

  get 'signup', to: 'registration#new'
  post 'signup', to: 'registration#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
