require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)



module Railsapi
  class Application < Rails::Application
	config.api_only = false;

	Rails.application.configure do
		config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
		config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]
		#config.middleware.use Rack::RedisThrottle::Daily, max: 100000

		config.middleware.insert_before 0, "Rack::Cors" do
			allow do
				origins '*'
				resource '*', :headers => :any, :methods => [:get, :post, :put, :patch, :delete, :options, :head]
			end
		end

	end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
