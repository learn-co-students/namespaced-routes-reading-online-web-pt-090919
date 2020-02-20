Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  # get '/admin/stats', to: 'stats#index'
  # get '/admin/authors/new', to: 'authors#new'
  # get '/admin/authors/delete', to: 'authors#delete'
  # get '/admin/authors/create', to: 'authors#create'
  # get '/admin/comments/moderate', to: 'comments#moderate'

  # Prefix a block of routes under one grouping /admin 
  # Tell scope to use /admin as URL prefix
  # Routes will be handled by controllers in admin module
  # scope '/admin', module 'admin' do
  # use namespace to route with a module & use its name as  URL prefix
  namespace :admin do
    resources :stats, only: [:index]
  end
  
  root 'posts#index'
end
