Rails.application.routes.draw do

  apipie
  	## API ##

  	namespace :api do
  	    namespace :v1 do
			get 'users/my_post';
			resources :users, only: [:index, :create, :show, :update, :destroy]
			resources :sessions, only: [:create]
			mount_devise_token_auth_for 'User', at: 'auth'

			resources :posts, only: [:show]
			scope '/posts' do
				get '/' => 'posts#index'
				post '/' => 'posts#create'
				scope '/:id' do
					get '/' => 'posts#show'
					put '/' => 'posts#update'
					delete '/' => 'posts#delete'
				end
			end
  	    end
  	 end

	get 'posts/index'
	get 'users/index'

	devise_for :users, controllers: {
		sessions: 'users/sessions'
	}

  	## end API ##
end
