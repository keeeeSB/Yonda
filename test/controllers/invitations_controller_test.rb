require "test_helper"

class InvitationsControllerTest < ActionDispatch::IntegrationTest
  test "家族招待ページの取得" do
    get new_invitation_path
    assert_response :success
  end
end
