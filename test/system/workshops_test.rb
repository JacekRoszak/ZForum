require "application_system_test_case"

class WorkshopsTest < ApplicationSystemTestCase
  setup do
    @workshop = workshops(:one)
  end

  test "visiting the index" do
    visit workshops_url
    assert_selector "h1", text: "Workshops"
  end

  test "creating a Workshop" do
    visit workshops_url
    click_on "New Workshop"

    fill_in "Content", with: @workshop.content
    fill_in "Graphic", with: @workshop.graphic
    fill_in "Link", with: @workshop.link
    fill_in "Start date", with: @workshop.start_date
    fill_in "User", with: @workshop.user_id
    click_on "Create Workshop"

    assert_text "Workshop was successfully created"
    click_on "Back"
  end

  test "updating a Workshop" do
    visit workshops_url
    click_on "Edit", match: :first

    fill_in "Content", with: @workshop.content
    fill_in "Graphic", with: @workshop.graphic
    fill_in "Link", with: @workshop.link
    fill_in "Start date", with: @workshop.start_date
    fill_in "User", with: @workshop.user_id
    click_on "Update Workshop"

    assert_text "Workshop was successfully updated"
    click_on "Back"
  end

  test "destroying a Workshop" do
    visit workshops_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Workshop was successfully destroyed"
  end
end
