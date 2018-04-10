require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @like = likes(:one)
    @token_header = get_auth_token_header
  end
  
  test "should get index" do
    get likes_url, headers: @token_header, as: :json
    assert_response :success
  end

  test "should create like" do
    assert_difference('Like.count') do
      post likes_url, headers: @token_header,  params: { like: { dog_id: @like.dog_id, user_id: users(:two).id  } }, as: :json
    end

    assert_response 201
  end

  test "should not create like if user has already liked the dog" do
    post likes_url, headers: @token_header,  params: { like: { dog_id: @like.dog_id, user_id: @like.user_id  } }, as: :json
    assert_response 422
  end

  test "should show like" do
    get like_url(@like), headers: @token_header,  as: :json
    assert_response :success
  end

  test "should update like" do
    patch like_url(@like),  headers: @token_header,  params: { like: { dog_id: @like.dog_id, user_id: users(:two).id } }, as: :json
    assert_response 200
  end

  test "should destroy like" do
    assert_difference('Like.count', -1) do
      delete like_url(@like),  headers: @token_header, as: :json
    end

    assert_response 204
  end
end
