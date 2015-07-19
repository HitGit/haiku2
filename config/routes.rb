Rails.application.routes.draw do

  resources :poems do
    resources :comments
  end

  root "poems#index"

end
