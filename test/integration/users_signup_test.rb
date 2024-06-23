require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "無効な情報で登録する" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "pas",
                                         password_confirmation: "word" } }
    end
    assert_response :unprocessable_entity
    assert_template 'users/new'
  end

  test "有効な情報で登録する" do
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'static_pages/top'
    assert is_logged_in?
  end
end
