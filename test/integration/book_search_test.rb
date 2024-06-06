require "test_helper"

class BookSearchTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:tarou)
  end

  test "絵本の名前を検索し、検索結果が表示される" do
    log_in_as(@user)
    get root_path

    search_query = "アンパンマン"
    get search_books_path, params: { search: search_query }

    assert_template 'books/search'
    assert_select "div.card", minimum: 1
    assert_select "h4.card-title", text: /#{search_query}/i
  end

  test "未入力で検索すると、エラーメッセージが表示される" do
    log_in_as(@user)
    get root_path

    search_query = " "
    get search_books_path, params: { search: search_query }

    assert_template 'books/search'
    assert_not flash.empty?
    assert_equal flash[:danger], I18n.t('books.search.failure')
  end
end
