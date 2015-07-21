Rails.application.routes.draw do

  devise_for :users
  resources :poems do
    resources :comments
  end

  root "poems#index"
  # root "pages#about"

  get '/about', to: 'pages#about'


end
