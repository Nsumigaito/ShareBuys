Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admins do

  	# root
  	root 'homes#top'

  	# posts
  	resources :posts, only: [:index, :destroy]
  end

  scope module: :users do

  	# root
  	root 'homes#top'

  	# devise
  	devise_for :users

  	# users
    get 'users/:id' => 'users#show', as: 'user'

    # プロフィール編集用 [name],[introduction],[profile_image] registrationsのeditとは別
    get 'profile_edit' => 'users#profile_edit', as: 'profile_edit'
    patch 'profile_update' => 'users#profile_update', as: 'profile_update'

  	# 残高画面へのルート
  	get '/users/balance' => 'users#balance', as: 'balance'

  	# フォロー・フォロワー一覧へのルート
  	get '/users/:id/following' => 'users#following', as: 'following_user'
  	get '/users/:id/followers' => 'users#followers', as: 'followers_user'

  	# 退会処理
  	get '/users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe_users'
    patch '/users/withdraw' => 'users#withdraw', as: 'withdraw_users'

    # relationships
    resources :relationships, only: [:create, :destroy]

    # searches
    get 'searches' => 'searches#search'

    # collections
    get 'collections' => 'collections#index'

    # posts
    resources :posts, only: [:new, :create, :index, :show, :destroy] do

    	# 投稿へのコメント
    	resources :post_comments, only: [:create, :destroy]

    	# 投稿へのいいね
    	resource :favorites, only: [:create, :destroy]
    end

    # 投稿を報告する
    patch '/post/:id' => 'posts#report', as: 'report'

    # orders
    resources :orders, only: [:new, :create, :index]

    # 注文確認画面
    get '/post/confilm' => 'posts#confilm', as: 'confilm'

    # notifications
    resources :notifications, only: [:index]

    # 設定画面
    get '/setting' => 'sets#setting', as: 'setting'
  end
end
