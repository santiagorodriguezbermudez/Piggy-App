Rails.application.routes.draw do
  
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  resources :savings
  resources :users
  root 'sessions#welcome'

end
