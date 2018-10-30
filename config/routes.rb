Rails.application.routes.draw do
  root "home#index"
  devise_for :users, :controllers => { registrations: 'registrations' }
  # task CRUD resource
  get 'task', to: 'task#index', as: :task_index
  get 'task/new', to: 'task#new', as: :task_new
  get 'task/:id/show', to: 'task#show', as: :task_show
  get 'task/:id/edit', to: 'task#edit', as: :task_edit
  get 'task/:id/destroy', to: 'task#destroy', as: :task_destroy
  post 'task/create', to: 'task#create', as: :task_create
  patch 'task/:id/update', to: "task#update", as: :task_update
  # share task route
  get 'task/:id/share', to: 'task#share', as: :task_share
  post 'task/:id/share', to: 'task#share_user', as: :share_task_user
  get 'share/tasks', to: 'share#index', as: :share_index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
