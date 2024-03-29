require "application_system_test_case"

class AnnouncementsTest < ApplicationSystemTestCase
  setup do
    @announcement = announcements(:one)
  end

  test "visiting the index" do
    visit announcements_url
    assert_selector "h1", text: "Announcements"
  end

  test "creating a Announcement" do
    visit announcements_url
    click_on "New Announcement"

    fill_in "Anniversarys", with: @announcement.anniversarys
    fill_in "Bdays", with: @announcement.bdays
    fill_in "Part one", with: @announcement.part_one
    fill_in "Part three", with: @announcement.part_three
    fill_in "Part two", with: @announcement.part_two
    fill_in "Wfl", with: @announcement.wfl
    click_on "Create Announcement"

    assert_text "Announcement was successfully created"
    click_on "Back"
  end

  test "updating a Announcement" do
    visit announcements_url
    click_on "Edit", match: :first

    fill_in "Anniversarys", with: @announcement.anniversarys
    fill_in "Bdays", with: @announcement.bdays
    fill_in "Part one", with: @announcement.part_one
    fill_in "Part three", with: @announcement.part_three
    fill_in "Part two", with: @announcement.part_two
    fill_in "Wfl", with: @announcement.wfl
    click_on "Update Announcement"

    assert_text "Announcement was successfully updated"
    click_on "Back"
  end

  test "destroying a Announcement" do
    visit announcements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Announcement was successfully destroyed"
  end
end
