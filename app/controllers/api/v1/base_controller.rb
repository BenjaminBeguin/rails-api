class Api::V1::BaseController < ApplicationController
	include Pundit

	protect_from_forgery with: :null_session
	before_action :destroy_session
	rescue_from ActiveRecord::RecordNotFound, with: :not_found

	def not_found
		return api_error(status: 404, errors: 'Not found')
	end

	def destroy_session
		request.session_options[:skip] = true
	end

	def authenticate_user!
		token, options = ActionController::HttpAuthentication::Token.token_and_options(request)

		user_email = options.blank?? nil : options[:email]
		user = user_email && User.find_by(email: user_email)

		if user && ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, token)
			@current_user = user
		else
			return unauthenticated!
		end
	 end


	def paginate(resource)
	    resource = resource.page(params[:page] || 1)
	    if params[:per_page]
	    	resource = resource.per_page(params[:per_page])
	    end

	    return resource
	end

	#expects pagination!
	def meta_attributes(object)
		{
			current_page: object.current_page,
			next_page: object.next_page,
			prev_page: object.previous_page,
			total_pages: object.total_pages,
			total_count: object.total_entries
		}
	end
end