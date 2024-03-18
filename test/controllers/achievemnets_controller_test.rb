require "test_helper"

class AchievemnetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @achievemnet = achievemnets(:one)
  end

  test "should get index" do
    get achievemnets_url
    assert_response :success
  end

  test "should get new" do
    get new_achievemnet_url
    assert_response :success
  end

  test "should create achievemnet" do
    assert_difference('Achievemnet.count') do
      post achievemnets_url, params: { achievemnet: { description: @achievemnet.description, image_link: @achievemnet.image_link, title: @achievemnet.title } }
    end

    assert_redirected_to achievemnet_url(Achievemnet.last)
  end

  test "should show achievemnet" do
    get achievemnet_url(@achievemnet)
    assert_response :success
  end

  test "should get edit" do
    get edit_achievemnet_url(@achievemnet)
    assert_response :success
  end

  test "should update achievemnet" do
    patch achievemnet_url(@achievemnet), params: { achievemnet: { description: @achievemnet.description, image_link: @achievemnet.image_link, title: @achievemnet.title } }
    assert_redirected_to achievemnet_url(@achievemnet)
  end

  test "should destroy achievemnet" do
    assert_difference('Achievemnet.count', -1) do
      delete achievemnet_url(@achievemnet)
    end

    assert_redirected_to achievemnets_url
  end
end
