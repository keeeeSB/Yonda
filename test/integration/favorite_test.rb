require "test_helper"

class FavoriteTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:tarou)
    @read_record = read_records(:one)
  end

  test "読み聞かせ記録にいいねをする" do
    log_in_as(@user)
    get home_path
    assert_response :success
    assert_template 'read_records/index'

    assert_difference '@read_record.favorites.count', 1 do
      post read_record_favorites_path(@read_record)
    end
  end
end
