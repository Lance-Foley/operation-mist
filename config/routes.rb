Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'crew_three_month_workload/index'
      get 'crew_three_month_workload/show'
      get 'crew_work_load/index'
      get 'crew_work_load/show'
      get 'charts/index'
      get 'charts/show'

    end
  end
  resources :projects
  resources :clients
  resources :roles

  get 'dashboard/index'
  get 'dashboard/three_month_workload'
  get 'dashboard/field_one_workload'
  get 'dashboard/field_two_workload'
  get 'dashboard/week_workload'
  devise_for :users
  get 'client/:id/projects' => 'clients#projects', :as => :client_projects
  get 'projects/:id/phase' => 'projects#phase', :as => :project_phase

  # devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :phases
  resources :divisions
  resources :crews
  root "home#index"
  resources :employees
  resources :jobs

  resources :schedule
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
