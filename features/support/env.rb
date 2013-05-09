require File.expand_path "../../../hi.rb", __FILE__
# Sinatra::Application.app_file = app_file

require 'webrat'
require 'rack/test'

Webrat.configure do |config|
  config.mode = :rack
end

class MyWorld
  include Rack::Test::Methods
  include Webrat::Methods
  include Webrat::Matchers

  Webrat::Methods.delegate_to_session :response_code, :response_body

  def app
    Sinatra::Application
  end
end

# Capybara.app = Sinatra::Application
World{MyWorld.new}
