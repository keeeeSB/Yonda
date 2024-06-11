require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "お問い合わせページの取得" do
    get new_contact_path
    assert_response :success
  end
end
