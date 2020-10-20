require "application_system_test_case"

class CommentCommentLikesTest < ApplicationSystemTestCase
  setup do
    @comment_comment_like = comment_comment_likes(:one)
  end

  test "visiting the index" do
    visit comment_comment_likes_url
    assert_selector "h1", text: "Comment Comment Likes"
  end

  test "creating a Comment comment like" do
    visit comment_comment_likes_url
    click_on "New Comment Comment Like"

    fill_in "Comment", with: @comment_comment_like.comment_id
    fill_in "User", with: @comment_comment_like.user_id
    click_on "Create Comment comment like"

    assert_text "Comment comment like was successfully created"
    click_on "Back"
  end

  test "updating a Comment comment like" do
    visit comment_comment_likes_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @comment_comment_like.comment_id
    fill_in "User", with: @comment_comment_like.user_id
    click_on "Update Comment comment like"

    assert_text "Comment comment like was successfully updated"
    click_on "Back"
  end

  test "destroying a Comment comment like" do
    visit comment_comment_likes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comment comment like was successfully destroyed"
  end
end
