require "test_helper"

class ReadRecordsControllerTest < ActionDispatch::IntegrationTest
  test "読み聞かせ記録一覧ページの取得" do
    get read_records_path
    assert_response :success
  end
end
