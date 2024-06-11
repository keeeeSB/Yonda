require "test_helper"

class PasswordResetsControllerTest < ActionDispatch::IntegrationTest
  test "パスワードリセットページの取得" do
    get new_password_reset_path
    assert_response :success
  end
end
