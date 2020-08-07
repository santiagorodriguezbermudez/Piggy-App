Rails.application.routes.draw do
  
  get 'projects/index'
  get 'projects/show'
  get 'projects/new'
  get 'projects/create'
  get 'projects/destroy'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  resources :savings
  resources :users
  root 'sessions#welcome'

  controller :savings do
    get 'savings_no_project' => :savings_with_no_project
  end
end
