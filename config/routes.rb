Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
    root to: 'public/homes#top'
    get '/about' => 'public/homes#about'
    namespace :public do
      post 'orders/info'
      get 'orders/complete'
      post 'orders/create'
      resources :orders, only: [:new, :index, :show]

      post 'cart_items/create'
      delete 'cart_items/all_destroy' => 'cart_items#all_destroy', as: 'all_destroy'
      delete 'cart_items/destroy/:id' => 'cart_items#destroy', as: 'cart_item_destroy'
      patch 'cart_items/update/:id' => 'cart_items#update', as: 'cart_item_update'

      resources :cart_items, only: [:index]

      get 'customers/withdrawal' => 'customers#withdrawal'
      patch 'customers/withdraw' => 'customers#withdraw'
      get 'customers/mypage' => 'customers#show'
      get 'customers/edit'
      patch 'customers/update' => 'customers#update'

      resources :items, only: [:index, :show]
    end


  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    get '/' => 'homes#top'
    get 'orders/show/:id' => 'orders#show'
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    patch 'customers/update/:id' => 'customers#update', as: 'customers_update'
    get 'items/index'
    get 'items/new'
    post 'items/create'
    get 'items/show/:id' => 'items#show', as: 'items_show'
    get 'items/edit/:id' => 'items#edit', as: 'items_edit'
    patch 'items/update/:id' => 'items#update', as: 'items_update'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
