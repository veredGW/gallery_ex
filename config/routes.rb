Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "articles#index"
  resources :articles
#   resources :articles, only: [:index, :show]
#   get "/articles", to: "articles#index"
end
