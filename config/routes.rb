Rails.application.routes.draw do

  #namespace :public do
    #get 'orders/new'
    #get 'orders/confirm'
    #get 'orders/thanks'
    #get 'orders/index'
    #get 'orders/show'
  #end

  #namespace :public do
    #get 'cart_items/index'
  #end
  #namespace :admin do
   # get 'homes/top'
  #end

  # namespace :admin do
  #   get 'orders/show'
  # end

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
get 'customers/quit' =>'public/customers#quit'#ECサイト側_顧客の退会確認画面
get 'items' =>'public/items#index'#ECサイト側_商品一覧画面
get 'items/:id' =>'public/items#show'#ECサイト側_商品詳細画面
get 'cart_items' =>'public/cart_items#index'#ECサイト側_カート画面

get 'orders/new' =>'public/orders#new'#ECサイト側_注文情報入力画面
get 'orders/confirm' =>'public/orders#confirm'#ECサイト側_注文情報確認画面
get 'orders/thanks' =>'public/orders#thanks'#ECサイト側_注文完了（サンクス）画面
get 'orders' =>'public/orders#index'#ECサイト側_注文履歴画面
get 'orders/:id' =>'public/orders#show'#ECサイト側_注文履歴詳細画面

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
get 'admin' =>'admin/homes#top'#管理者側_トップ画面
get 'admin/orders/:id' =>'admin/orders#show'#管理者_注文詳細画面

end