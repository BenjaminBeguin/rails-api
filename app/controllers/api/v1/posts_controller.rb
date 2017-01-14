class Api::V1::PostsController < Api::V1::BaseController
	before_action :authenticate_user!, only: [:create, :update]
	before_filter :find_posts, only: [:show, :update, :delete]

	def_param_group :posts do
	  param :title, String , :required => true
	  param :content, String, :required => true
	end

	def_param_group :auth do
	  param :access_token, String , :required => true
	  param :uid, String, :required => true
	  param :client, String, :required => true
	end

	def show
		post = Post.find(params[:id])
		render(json: Api::V1::PostSerializer.new(post).to_json)
	end


	api :GET, "/posts", "Show all posts"
	# param :order, ["id"], :desc => "array validator"
	# param :asc, [true, false], :desc => "array validator"
	def index
	    posts = Post.all

	    render(
	      json: ActiveModel::ArraySerializer.new(
	        posts,
	        each_serializer: Api::V1::PostSerializer,
	        root: 'posts',
	      )
	    )
	end

	api :POST, "/posts", "Create posts"
	param_group :auth
	param_group :posts
	def create
		@json = JSON.parse(request.body.read)
	    if @post.present?
	      render nothing: true, status: :conflict
	    else
			@post = Post.new(params.require(:post).permit(:title, :content));
			@post.user_id = current_user.id;
			if @post.save
				render json: @post
			else
			 	render nothing: true, status: :bad_request
			end
		end
	end

	api :PUT, "/posts/:id", "Update post"
	param_group :auth
	param_group :posts
	def update
		@json = JSON.parse(request.body.read)
	    if @post.present?
			@post.update(params.require(:post).permit(:title, :content));
			if @post.save
				render json: @post
			else
				render json: {"error": "can't save"}
			 	#render nothing: true, status: :bad_request
			end
	    else
	      	render nothing: true, status: :conflict
		end
	end

	api :DELETE, "/posts/:id", "Delete a post"
	param_group :auth
	def delete
		@json = JSON.parse(request.body.read)
		if is_my_post
			render json: @post
			@post.delete
		else
			render json: {"error": "not your post"}
		end
	end

	def is_my_post
		@post.user_id.to_i == current_user.id.to_i
	end

	def find_posts
		@post = Post.find_by_id(params[:id])
		render nothing: true, status: :not_found unless @post.present? #&& @post.user_id == @user
	end
end