require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", "Yonda"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "よんだとは | Yonda"
  end

  test "should get home" do
    get home_path
    assert_response :success
    assert_select "title", "ホーム | Yonda"
  end
end
