Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do #routing errorが出たのでscope moduleを付けておきました。
    root to: 'homes#top'
    get "about"=>"homes#about"

    get 'customers/mypage'=>"customers#show"
    get "customers/mypage/edit"=>"customers#edit"
    patch "customers/mypage"=>"customers#update"
    get 'customers/mypage/confirm'=>"customers#confirm"
    patch 'customers/mypage/withdraw'=>"customers#withdraw"

    post 'orders/confirm'=>'orders#confirm'
    get "orders/complete"=>"orders#complete"
    resources :orders, only: [:new, :create, :index, :show]


    delete "cart_items/destroy_all"=>"cart_items#destroy_all"
    resources :cart_items, only: [:index, :update, :destroy, :create]


    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :items, only: [:index, :show]
  end

  namespace :admin do
    get  "/"=>"homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
