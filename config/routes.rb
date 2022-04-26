Rails.application.routes.draw do
  resources :roles

  get 'dashboard/index'
  get 'dashboard/three_month_workload'
  get 'dashboard/field_one_workload'
  devise_for :users

  # devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :phases
  resources :divisions
  resources :crews
  root "home#index"
  resources :employees
  resources :jobs
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
