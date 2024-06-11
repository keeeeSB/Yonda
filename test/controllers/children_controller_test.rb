require "test_helper"

class ChildrenControllerTest < ActionDispatch::IntegrationTest
  test "お子さま登録ページの取得" do
    get new_child_path
    assert_response :success
  end
end
