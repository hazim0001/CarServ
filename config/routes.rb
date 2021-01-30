Rails.application.routes.draw do
  get 'jobs/index'
  get 'jobs/new'
  get 'jobs/create'
  get 'jobs/edit'
  get 'jobs/update'
  get 'jobs/set_job'
  get 'jobs/job_params'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :jobs do
    resources :line_parts, only: :create
    resources :line_labour, only: :create
  end

  resources :part_suppliers
  resources :labour_jobs
  resources :mechanics
  resources :customers
  resources :part_inventories do
    resources :inventory_suppliers, only: :create
    resources :inventory_restocks, only: :create

  end

  resources :line_parts, only: %i[destroy update]
  resources :line_labour, only: %i[destroy update]
  resources :inventory_suppliers, only: %i[destroy update]
  resources :inventory_restocks, only: %i[destroy]
end
