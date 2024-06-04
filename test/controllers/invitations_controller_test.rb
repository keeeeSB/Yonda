require "test_helper"

class InvitationsControllerTest < ActionDispatch::IntegrationTest
  test "家族招待ページの取得" do
    get invitations_new_url
    assert_response :success
  end
end
