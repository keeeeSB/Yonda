require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "ログインページの取得" do
    get login_path
    assert_response :success
  end
end
