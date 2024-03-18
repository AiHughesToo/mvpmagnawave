require "application_system_test_case"

class AchievemnetsTest < ApplicationSystemTestCase
  setup do
    @achievemnet = achievemnets(:one)
  end

  test "visiting the index" do
    visit achievemnets_url
    assert_selector "h1", text: "Achievemnets"
  end

  test "creating a Achievemnet" do
    visit achievemnets_url
    click_on "New Achievemnet"

    fill_in "Description", with: @achievemnet.description
    fill_in "Image link", with: @achievemnet.image_link
    fill_in "Title", with: @achievemnet.title
    click_on "Create Achievemnet"

    assert_text "Achievemnet was successfully created"
    click_on "Back"
  end

  test "updating a Achievemnet" do
    visit achievemnets_url
    click_on "Edit", match: :first

    fill_in "Description", with: @achievemnet.description
    fill_in "Image link", with: @achievemnet.image_link
    fill_in "Title", with: @achievemnet.title
    click_on "Update Achievemnet"

    assert_text "Achievemnet was successfully updated"
    click_on "Back"
  end

  test "destroying a Achievemnet" do
    visit achievemnets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Achievemnet was successfully destroyed"
  end
end
