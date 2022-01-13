Rails.application.routes.draw do
  get 'project/showlist/', to: "project#showlist"
  get '/project/deal_with', to: "project#deal_with" ,as: 'deal_with'

  resources :list_container
  resources :project
  root to: "project#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
