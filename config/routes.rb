Rails.application.routes.draw do

  devise_for :users

  resources :poems do
    member do
      put "like",    to: "poems#upvote"
      put "dislike", to: "poems#downvote"
    end
    resources :comments
  end


  root "poems#index"
  # root "pages#about"

  get '/about', to: 'pages#about'

end