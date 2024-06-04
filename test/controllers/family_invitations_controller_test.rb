require "test_helper"

class FamilyInvitationsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:tarou)
    @family = @user.family
    log_in_as(@user)
  end

  test "家族登録ページの取得" do
    get new_family_invitation_path(@family)
    assert_response :success
  end
end
