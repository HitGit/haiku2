Rails.application.routes.draw do

  resources :poems do
    resources :comments
  end

  root "poems#index"

  get '/about', to: 'pages#about'


end
