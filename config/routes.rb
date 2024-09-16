# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'

  resources :posts, path: '/blog', param: :id do
    resources :comments, only: :create
  end

  get '/blog/categories/:slug', to: 'categories#show', as: :category_posts_by_slug

  # Defines page routes e.g. About, Contact
  resources :pages, path: '', param: :action, only: [:show]
end
