# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'
  # Defines the routes for Inquiry submissions
  resources :inquiries, only: [:new, :create] do
    collection do
      get 'cancel'
    end
  end

  # Defines page routes e.g. About, Contact
  resources :pages, path: '', param: :action, only: [:show]

  # Defines the post/blog routes
  resources :posts, path: '/blog', param: :id do
    # Defines the comments routes
    resources :comments, only: :create
  end
  
  # TODO: Rework this attempt at category pages
  get '/blog/categories/:slug', to: 'categories#show', as: :category_posts_by_slug
end
