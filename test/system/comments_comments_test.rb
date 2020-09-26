require "application_system_test_case"

class CommentsCommentsTest < ApplicationSystemTestCase
  setup do
    @comments_comment = comments_comments(:one)
  end

  test "visiting the index" do
    visit comments_comments_url
    assert_selector "h1", text: "Comments Comments"
  end

  test "creating a Comments comment" do
    visit comments_comments_url
    click_on "New Comments Comment"

    fill_in "Content", with: @comments_comment.content
    fill_in "Postcomment", with: @comments_comment.postcomment_id
    fill_in "User", with: @comments_comment.user_id
    click_on "Create Comments comment"

    assert_text "Comments comment was successfully created"
    click_on "Back"
  end

  test "updating a Comments comment" do
    visit comments_comments_url
    click_on "Edit", match: :first

    fill_in "Content", with: @comments_comment.content
    fill_in "Postcomment", with: @comments_comment.postcomment_id
    fill_in "User", with: @comments_comment.user_id
    click_on "Update Comments comment"

    assert_text "Comments comment was successfully updated"
    click_on "Back"
  end

  test "destroying a Comments comment" do
    visit comments_comments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comments comment was successfully destroyed"
  end
end
