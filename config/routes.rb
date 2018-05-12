Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get('carts/:id', { to: 'carts#show', as: :cart })
  delete('carts/:id', { to: 'carts#destroy' })

  resources :line_items, only: [:show, :create, :destroy] do
    member do
      patch :add
      patch :reduce
    end
  end

  resources :orders, shallow: true, only: [:new, :create] do 
    resources :charges, only: [:new, :create]
  end

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:create, :new, :show] 
  resources :confirmations, only: [:show]

  resources :arts do
    resources :favourites, shallow: true, only: [ :create, :destroy ]
    resources :reviews, shallow: true, only: [ :create, :destroy ]
  end

  resources :items do
    resources :favourites, shallow: true, only: [ :create, :destroy ]
    resources :reviews, shallow: true, only: [:create, :destroy]
  end

  resources :final_products do
    resources :favourites, shallow: true, only: [ :create, :destroy ]
    resources :reviews, shallow: true, only: [:create, :destroy]
  end

  resources :favourites, only: [:index]
  resources :tags, only: [:show, :index]

  root 'pages#home'
  get('/about', { to: 'pages#about', as: :about })
  get('/how_to_shape', { to: 'pages#how_to_shape', as: :shape })
  get('/contact_us', { to: 'contacts#index', as: :contact })
  post('/contact_us', { to: 'contacts#create' })

end
