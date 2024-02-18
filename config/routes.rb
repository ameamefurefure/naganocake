Rails.application.routes.draw do
  #namespace :admin do
   # get 'homes/top'
  #end

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
get 'items' =>'public/items#index'#
get 'customers' =>'public/customers#show'

get '/' =>'public/homes#top'#ECサイト側_トップページ
get 'about' =>'public/homes#about'#ECサイト側_アバウトページ
get 'customers/information/edit' =>'public/customers#edit'#ECサイト側_顧客の登録情報編集画面

#管理者側のルーティング設定
namespace :admin do
  resources :items, only: [:new, :index, :show, :edit]
  resources :customers, only: [:index, :show, :edit]
end

# resourcesメソッドにより下記コメントアウト
# get 'admin/items/new' =>'admin/items#new'#管理者側_商品新規登録画面
# get 'admin/items' =>'admin/items#index'#管理者側_商品一覧画面
# get 'admin/items/:id' =>'admin/items#show'#管理者側_商品詳細画面
# get 'admin/items/:id/edit' =>'admin/items#edit'#管理者側_商品編集画面
# get 'admin/customers' =>'admin/customers#index'#管理者側_顧客一覧画面
# get 'admin/customers/:id' =>'admin/customers#show'#管理者側_顧客詳細画面
# get 'admin/customers/:id/edit' =>'admin/customers#edit'#管理者側_顧客編集画面
get 'admin' =>'admin/homes#top'#管理者トップ画面

end