Rails.application.routes.draw do
  
  #HOMEPAGE

  root "movies#index" 

  resources :movies

  resources :directors

  #------------------------------
end