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
    google_book['volumeInfo']['bookImage'] = google_book.dig('volumeInfo', 'imageLinks', 'thumbnail')
    if google_book['volumeInfo']['bookImage'].present?
      google_book['volumeInfo']['bookImage'] = google_book['volumeInfo']['bookImage'].gsub("http", "https")
    end

    if google_book['volumeInfo']['industryIdentifiers']&.select { |h| h["type"].include?("ISBN") }.present?
      google_book['volumeInfo']['systemid'] = google_book['volumeInfo']['industryIdentifiers'].select { |h| h["type"].include?("ISBN") }.first["identifier"]
    end

    google_book['volumeInfo'].slice('title', 'authors', 'publishedDate', 'infoLink', 'bookImage', 'systemid', 'canonicalVolumeLink')
  end
end
