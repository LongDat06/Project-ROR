Rails.application.routes.draw do
  get 'project/showlist'
  get "/project", to: "project#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
