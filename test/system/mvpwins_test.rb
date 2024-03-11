require "application_system_test_case"

class MvpwinsTest < ApplicationSystemTestCase
  setup do
    @mvpwin = mvpwins(:one)
  end

  test "visiting the index" do
    visit mvpwins_url
    assert_selector "h1", text: "Mvpwins"
  end

  test "creating a Mvpwin" do
    visit mvpwins_url
    click_on "New Mvpwin"

    fill_in "Details", with: @mvpwin.details
    click_on "Create Mvpwin"

    assert_text "Mvpwin was successfully created"
    click_on "Back"
  end

  test "updating a Mvpwin" do
    visit mvpwins_url
    click_on "Edit", match: :first

    fill_in "Details", with: @mvpwin.details
    click_on "Update Mvpwin"

    assert_text "Mvpwin was successfully updated"
    click_on "Back"
  end

  test "destroying a Mvpwin" do
    visit mvpwins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mvpwin was successfully destroyed"
  end
end
