require "application_system_test_case"

class NominationsTest < ApplicationSystemTestCase
  setup do
    @nomination = nominations(:one)
  end

  test "visiting the index" do
    visit nominations_url
    assert_selector "h1", text: "Nominations"
  end

  test "creating a Nomination" do
    visit nominations_url
    click_on "New Nomination"

    fill_in "Nom body", with: @nomination.nom_body
    fill_in "Nom type", with: @nomination.nom_type
    fill_in "Receiver img link", with: @nomination.receiver_img_link
    fill_in "Receiver name", with: @nomination.receiver_name
    fill_in "Sender", with: @nomination.sender_id
    fill_in "Sender name", with: @nomination.sender_name
    fill_in "User", with: @nomination.user_id
    click_on "Create Nomination"

    assert_text "Nomination was successfully created"
    click_on "Back"
  end

  test "updating a Nomination" do
    visit nominations_url
    click_on "Edit", match: :first

    fill_in "Nom body", with: @nomination.nom_body
    fill_in "Nom type", with: @nomination.nom_type
    fill_in "Receiver img link", with: @nomination.receiver_img_link
    fill_in "Receiver name", with: @nomination.receiver_name
    fill_in "Sender", with: @nomination.sender_id
    fill_in "Sender name", with: @nomination.sender_name
    fill_in "User", with: @nomination.user_id
    click_on "Update Nomination"

    assert_text "Nomination was successfully updated"
    click_on "Back"
  end

  test "destroying a Nomination" do
    visit nominations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nomination was successfully destroyed"
  end
end
