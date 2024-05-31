require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "新規登録ページの取得" do
    get signup_path
    assert_response :success
    assert_select "title", "新規登録 | Yonda"
  end

  def setup
    @user = users(:tarou)
  end

  test "マイページの取得" do
    log_in_as(@user)
    assert_redirected_to user_path(@user)
    follow_redirect!
    assert_template "users/show"
    assert_select "title", "Tarou Exampleのページ | Yonda"
  end
end
