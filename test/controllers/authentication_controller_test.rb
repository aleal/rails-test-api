require 'test_helper'

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end
  test "should authenticate  user" do
    post "/authenticate", params: { credentials: { email: "aleal4343@gmail.com", password: "1234566" } }, as: :json
    assert_response 200
  end

  test "should authenticate user by token" do 
     post "/authenticate_by_token", headers: get_auth_token_header, as: :json  
     assert_response 200
  end
  
end
