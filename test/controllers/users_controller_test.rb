require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @token_header = get_auth_token_header
  end
  
  test "should get index" do
    get users_url, headers: @token_header,  as: :json
    assert_response :success
  end
    test "should create user" do
    assert_difference('User.count') do
      post users_url, params: { user: { avatar: @user.avatar, email: "test@test.com", name: @user.name, password: "121213" } }, as: :json
    end

    assert_response 201
  end

  test "should show user" do
    get user_url(@user), headers: @token_header, as: :json
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), headers: @token_header, params: { user: { avatar: @user.avatar, email: @user.email, name: @user.name, password: "userpassword" } }, as: :json
    assert_response 200
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user), headers: @token_header, as: :json
    end

    assert_response 204
  end
end
