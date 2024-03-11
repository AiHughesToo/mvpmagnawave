require "test_helper"

class MvpwinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mvpwin = mvpwins(:one)
  end

  test "should get index" do
    get mvpwins_url
    assert_response :success
  end

  test "should get new" do
    get new_mvpwin_url
    assert_response :success
  end

  test "should create mvpwin" do
    assert_difference('Mvpwin.count') do
      post mvpwins_url, params: { mvpwin: { details: @mvpwin.details } }
    end

    assert_redirected_to mvpwin_url(Mvpwin.last)
  end

  test "should show mvpwin" do
    get mvpwin_url(@mvpwin)
    assert_response :success
  end

  test "should get edit" do
    get edit_mvpwin_url(@mvpwin)
    assert_response :success
  end

  test "should update mvpwin" do
    patch mvpwin_url(@mvpwin), params: { mvpwin: { details: @mvpwin.details } }
    assert_redirected_to mvpwin_url(@mvpwin)
  end

  test "should destroy mvpwin" do
    assert_difference('Mvpwin.count', -1) do
      delete mvpwin_url(@mvpwin)
    end

    assert_redirected_to mvpwins_url
  end
end
