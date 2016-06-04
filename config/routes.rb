Rails.application.routes.draw do
  resources :annonces 

  root 'annonces#index'
  get '/result', to: 'annonces#result'

end
