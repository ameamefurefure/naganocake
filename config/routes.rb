Rails.application.routes.draw do
  # devise_for :admins
  # devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers:{
  sessions: "admin/sessions"
}

#会員側のルーティング設定
get 'items' =>'public/items#index'
get 'customers' =>'public/customers#show'

#管理者側のルーティング設定
namespace :admin do
  resources :items, only: [:index]
end
get 'admin/items/new' =>'admin/items#new'#商品新規登録画面
get 'admin/items' =>'admin/items#index'#商品一覧画面
get 'admin/items/:id' =>'admin/items#show'#商品詳細画面
end