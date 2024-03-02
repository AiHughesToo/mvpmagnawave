require "test_helper"

class NominationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @nomination = nominations(:one)
  end

  test "should get index" do
    get nominations_url
    assert_response :success
  end

  test "should get new" do
    get new_nomination_url
    assert_response :success
  end

  test "should create nomination" do
    assert_difference('Nomination.count') do
      post nominations_url, params: { nomination: { nom_body: @nomination.nom_body, nom_type: @nomination.nom_type, receiver_img_link: @nomination.receiver_img_link, receiver_name: @nomination.receiver_name, sender_id: @nomination.sender_id, sender_name: @nomination.sender_name, user_id: @nomination.user_id } }
    end

    assert_redirected_to nomination_url(Nomination.last)
  end

  test "should show nomination" do
    get nomination_url(@nomination)
    assert_response :success
  end

  test "should get edit" do
    get edit_nomination_url(@nomination)
    assert_response :success
  end

  test "should update nomination" do
    patch nomination_url(@nomination), params: { nomination: { nom_body: @nomination.nom_body, nom_type: @nomination.nom_type, receiver_img_link: @nomination.receiver_img_link, receiver_name: @nomination.receiver_name, sender_id: @nomination.sender_id, sender_name: @nomination.sender_name, user_id: @nomination.user_id } }
    assert_redirected_to nomination_url(@nomination)
  end

  test "should destroy nomination" do
    assert_difference('Nomination.count', -1) do
      delete nomination_url(@nomination)
    end

    assert_redirected_to nominations_url
  end
end
