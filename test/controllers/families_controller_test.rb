require "test_helper"

class FamiliesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:tarou)
    @family = @user.family
    log_in_as(@user)
  end

  test "家族グループ登録ページの取得" do
    get new_family_path
    assert_response :success
  end

  test "家族ページの取得" do
    get family_path(@family)
    assert_response :success
    assert_template 'families/show'
    assert_select "title", "家族ページ | Yonda"
  end
end
