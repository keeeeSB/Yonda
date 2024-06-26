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

  test "読み聞かせ記録にいいねをして、取り消す" do
    log_in_as(@user)
    get home_path
    assert_response :success
    assert_template 'read_records/index'

    assert_difference '@read_record.favorites.count', 1 do
      post read_record_favorites_path(@read_record)
    end

    @favorite = Favorite.find_by(user: @user, read_record: @read_record)

    assert_difference '@read_record.favorites.count', -1 do
      delete read_record_favorite_path(@read_record, @favorite)
    end
  end
end
