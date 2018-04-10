require 'test_helper'

class DogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dog = dogs(:one)
    @token_header = get_auth_token_header 
  end

  test "should get index" do
    get dogs_url, headers: @token_header, as: :json
    assert_response :success
  end

  test "should create dog" do
    assert_difference('Dog.count') do
      post dogs_url, headers: @token_header, params: { dog: { name: @dog.name, picture: @dog.picture, user_id: @dog.user_id } }, as: :json
    end
    assert_response 201
  end

  test "should add a like on dog creation by default" do
    assert_difference('Like.count') do
      post dogs_url, headers: @token_header, params: { dog: { name: @dog.name, picture: @dog.picture, user_id: @dog.user_id } }, as: :json
    end
    assert_response 201
  end

  test "should show dog" do
    get dog_url(@dog), headers: @token_header, as: :json
    assert_response :success
  end

  test "should update dog" do
    patch dog_url(@dog),  headers: @token_header, params: { dog: { name: @dog.name, picture: @dog.picture, user_id: @dog.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy dog" do
    assert_difference('Dog.count', -1) do
      delete dog_url(@dog), headers: @token_header, as: :json
    end

    assert_response 204
  end
end
