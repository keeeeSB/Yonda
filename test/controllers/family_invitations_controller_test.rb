require "test_helper"

class FamilyInvitationsControllerTest < ActionDispatch::IntegrationTest
  test "家族登録ページの取得" do
    get family_invitations_new_url
    assert_response :success
  end
end
