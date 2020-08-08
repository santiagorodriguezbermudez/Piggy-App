Rails.application.routes.draw do
  resources :projects, only: [:create, :new, :index, :show]

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
    get 'welcome' => :welcome
  end
  resources :savings
  resources :users
  root 'users#show'

  controller :savings do
    get 'savings_no_project' => :savings_with_no_project
  end
end
