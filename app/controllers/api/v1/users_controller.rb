class Api::V1::UsersController < Api::V1::BaseController
	before_action :authenticate_user!

	def show
		user = User.find(params[:id])
		render(json: Api::V1::UserSerializer.new(user).to_json)
	end

	def index
	    users = User.all

	    render(
	      json: ActiveModel::ArraySerializer.new(
	        users,
	        each_serializer: Api::V1::UserSerializer,
	        root: 'users',
	      )
	    )
	end

	def my_post
		user = current_user
		render json: user
	end

end