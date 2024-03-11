module ApplicationHelper

  # ページごとの完全なタイトルを返す
  def full_title(page_title = '')
    base_title = "Yonda"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def google_book_thumbnail(google_book)
    google_book['volumeInfo']['imageLinks'].nil? ? 'sample.png' : google_book['volumeInfo']['imageLinks']['thumbnail']
  end
  
  def set_google_book_params(google_book)
    google_book['volumeInfo']['thumbnail'] = google_book.dig('volumeInfo', 'imageLinks', 'thumbnail')&.gsub("http", "https")
  
    # ISBNは13桁と10桁があり、どちら1つを取得できればよいので、最初に検索した値をisbnに代入する
    if google_book['volumeInfo']['industryIdentifiers']&.select { |h| h["type"].include?("ISBN") }.present?
      google_book['volumeInfo']['isbn'] = google_book['volumeInfo']['industryIdentifiers']&.select { |h| h["type"].include?("ISBN") }.first["identifier"]
    end
  
    # volumeInfoの中が必要な項目のみになるようsliceを使って絞り込む
    google_book['volumeInfo'].slice('title', 'authors', 'publishedDate', 'thumbnail', 'isbn', 'canonicalVolumeLink')
  end
  
end
