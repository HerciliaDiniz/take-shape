Rails.application.routes.draw do
  
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'carts/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get('carts/:id', { to: 'carts#show', as: :cart })
  delete('carts/:id', { to: 'carts#destroy' })

  # patch('line_items/:id/add', { to: 'line_items#add_quantity', as: :line_item_add })
  # patch('line_items/:id/reduce', { to: 'line_items#reduce_quantity', as: :line_item_reduce })
  # post('line_items', { to: 'line_items#create' })
  # get('line_items/:id', { to: 'line_items#show', as: :line_item })
  # delete('line_items/:id', { to: 'line_items#destroy'})


  resources :line_items, only: [:show, :create, :destroy] do
    member do
      patch :add
      patch :reduce
    end
  end

  resources :orders
  resources :charges

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
