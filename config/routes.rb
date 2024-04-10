Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
    
  }
  delete '/users/sign_out', to: 'users/sessions#destroy'
  get '/users', to: 'users#index'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
 
  
  
  
  # Routes for page contents

  # Routes for About and Contact Us pages
  get '/about_us', to: 'static_pages#about_us'
  get '/contact_us', to: 'static_pages#contact_us'
  get '/static_pages/edit', to: 'static_pages#edit', as: 'edit_contact_us'
  

  # Devise routes for Admin Users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  post 'products/:id/add_to_cart', to: 'products#add_to_cart', as: 'add_to_cart'
  get 'cart/success', to: 'cart#success', as: 'cart_success'
  
  # Cart routes
  get 'cart', to: 'cart#show'
  resource :cart, only: [:show,:update]
  patch 'update_quantity', to: 'cart#update_quantity', as: 'update_quantity'
  get 'remove_item', to: 'cart#remove_item', as: 'remove_item'
  get '/checkout', to: 'checkout#index', as: 'checkout'
  post '/checkout', to: 'checkout#process_checkout', as: :process_checkout

  # Routes for search functionality
  get '/product_search', to: 'search#index', as: 'product_search'
  get '/search', to: 'search#index', as: 'search'
  
  # Routes for the home page
  root 'home#index'

  # Route to display categories
  resources :categories, only: [:index]
  resources :categories

  # Route to display FAQ page
  get '/faq', to: 'static_pages#faq'

  # Nested routes for categories and products
  resources :categories, only: [] do
    resources :products, only: [:index]
  end

  # Routes for products
  resources :products, only: [:index, :show]

  resources :checkout do
    collection do
      post 'product'
    end
  end

  # Routes for page contents


  # Routes for updating page contents (Admin namespace)
  namespace :admin do
    resource :contact_us, only: [:edit, :update], path: 'contact_us'
    resource :about_us, only: [:edit, :update], path: 'about_us'
  end
  
  # Define additional routes as needed
end
