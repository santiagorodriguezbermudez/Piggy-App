Rails.application.routes.draw do
  resources :projects, only: [:create, :new, :index, :show]

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
    get 'welcome' => :welcome
  end

  resources :savings, only: [:create, :new, :index]
  resources :users, only: [:create, :new, :show, :index]
  
  controller :savings do
    get 'savings_no_project' => :savings_with_no_project
  end
  
  root 'users#show'
end
