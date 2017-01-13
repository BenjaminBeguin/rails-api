Rails.application.routes.draw do





  	## API ##

  	namespace :api do
  	    namespace :v1 do
			get 'users/my_post';
			resources :users, only: [:index, :create, :show, :update, :destroy]
			resources :posts, only: [:index, :show]
			#resources :sessions, only: [:create]
  	    end
  	 end

	mount_devise_token_auth_for 'User', at: 'auth'
	get 'posts/index'
	get 'users/index'

	# devise_for :users, controllers: {
	# 	sessions: 'users/sessions'
	# }

  	## end API ##
end
