class BooksController < ApplicationController

  def search
    if params[:search].nil?
      return
    elsif params[:search].blank?
      flash.now[:danger] = "検索ワードが入力されていません"
      return
    else
      url = "https://www.googleapis.com/books/v1/volumes"
      text = params[:search]
      res = Faraday.get(url, q: text, langRestrict: 'ja', maxResults: 20)
      @google_books = JSON.parse(res.body)
    end
  end
end
