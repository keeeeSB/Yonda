require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "検索結果ページの取得" do
    get search_books_path
    assert_response :success
    assert_select "form[action=?][method=?]", search_books_path, "get"
  end

  test "検索結果の表示" do
    get search_books_path, params: { search: "Ruby" }
    assert_response :success
    assert_not_nil assigns(:google_books)
    assert_select "div.card", minimum: 1
  end
end
