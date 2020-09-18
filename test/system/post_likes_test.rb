require "application_system_test_case"

class PostLikesTest < ApplicationSystemTestCase
  setup do
    @post_like = post_likes(:one)
  end

  test "visiting the index" do
    visit post_likes_url
    assert_selector "h1", text: "Post Likes"
  end

  test "creating a Post like" do
    visit post_likes_url
    click_on "New Post Like"

    fill_in "Post", with: @post_like.post_id
    fill_in "User", with: @post_like.user_id
    click_on "Create Post like"

    assert_text "Post like was successfully created"
    click_on "Back"
  end

  test "updating a Post like" do
    visit post_likes_url
    click_on "Edit", match: :first

    fill_in "Post", with: @post_like.post_id
    fill_in "User", with: @post_like.user_id
    click_on "Update Post like"

    assert_text "Post like was successfully updated"
    click_on "Back"
  end

  test "destroying a Post like" do
    visit post_likes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post like was successfully destroyed"
  end
end
