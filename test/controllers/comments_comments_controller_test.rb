require 'test_helper'

class CommentsCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comments_comment = comments_comments(:one)
  end

  test "should get index" do
    get comments_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_comments_comment_url
    assert_response :success
  end

  test "should create comments_comment" do
    assert_difference('CommentsComment.count') do
      post comments_comments_url, params: { comments_comment: { content: @comments_comment.content, postcomment_id: @comments_comment.postcomment_id, user_id: @comments_comment.user_id } }
    end

    assert_redirected_to comments_comment_url(CommentsComment.last)
  end

  test "should show comments_comment" do
    get comments_comment_url(@comments_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_comments_comment_url(@comments_comment)
    assert_response :success
  end

  test "should update comments_comment" do
    patch comments_comment_url(@comments_comment), params: { comments_comment: { content: @comments_comment.content, postcomment_id: @comments_comment.postcomment_id, user_id: @comments_comment.user_id } }
    assert_redirected_to comments_comment_url(@comments_comment)
  end

  test "should destroy comments_comment" do
    assert_difference('CommentsComment.count', -1) do
      delete comments_comment_url(@comments_comment)
    end

    assert_redirected_to comments_comments_url
  end
end
