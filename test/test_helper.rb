ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end


class ActionDispatch::IntegrationTest
  def get_auth_token_header
    {"Authorization"=> AuthenticateUser.call(email: "aleal4343@gmail.com", password: "1234566").result[:token]}
  end
end
