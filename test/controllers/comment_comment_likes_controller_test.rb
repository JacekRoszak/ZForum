require 'test_helper'

class CommentCommentLikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment_comment_like = comment_comment_likes(:one)
  end

  test "should get index" do
    get comment_comment_likes_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_comment_like_url
    assert_response :success
  end

  test "should create comment_comment_like" do
    assert_difference('CommentCommentLike.count') do
      post comment_comment_likes_url, params: { comment_comment_like: { comment_id: @comment_comment_like.comment_id, user_id: @comment_comment_like.user_id } }
    end

    assert_redirected_to comment_comment_like_url(CommentCommentLike.last)
  end

  test "should show comment_comment_like" do
    get comment_comment_like_url(@comment_comment_like)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_comment_like_url(@comment_comment_like)
    assert_response :success
  end

  test "should update comment_comment_like" do
    patch comment_comment_like_url(@comment_comment_like), params: { comment_comment_like: { comment_id: @comment_comment_like.comment_id, user_id: @comment_comment_like.user_id } }
    assert_redirected_to comment_comment_like_url(@comment_comment_like)
  end

  test "should destroy comment_comment_like" do
    assert_difference('CommentCommentLike.count', -1) do
      delete comment_comment_like_url(@comment_comment_like)
    end

    assert_redirected_to comment_comment_likes_url
  end
end
