require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "rootページの取得" do
    get root_path
    assert_response :success
    assert_select "title", "Yonda"
  end

  test "aboutページの取得" do
    get about_path
    assert_response :success
    assert_select "title", "よんだとは | Yonda"
  end

  test "ホームページの取得" do
    get home_path
    assert_response :success
    assert_select "title", "ホーム | Yonda"
  end

  test "利用規約ページの取得" do
    get terms_path
    assert_response :success
    assert_select "title", "利用規約 | Yonda"
  end

  test "プライバシーポリシーページの取得" do
    get privacy_path
    assert_response :success
    assert_select "title", "プライバシーポリシー | Yonda"
  end
end
