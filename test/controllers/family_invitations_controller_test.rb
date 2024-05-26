require "test_helper"

class FamilyInvitationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get family_invitations_new_url
    assert_response :success
  end
end
