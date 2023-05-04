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
      get 'orders/info'
      get 'orders/complete'
      get 'cart_items/all_destroy'
      get 'customers/withdrawal'
      get 'customers/withdraw'
      get 'customers/mypage' => 'customers#show'
      get 'customers/edit'
      get 'custmers/update'
      resources :orders,     only: [:new, :create, :index, :show]
      resources :cart_items, only: [:index, :update, :destroy, :create]
      resources :items,      only: [:index, :show]
    end


  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    get '/' => 'homes#top'
    get 'orders/show'
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'items/index'
    get 'items/new'
    get 'items/create'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
