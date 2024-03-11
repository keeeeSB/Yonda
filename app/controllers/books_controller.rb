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

  def index
    @book = Book.all
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save_with_author(authors_params[:authors])
      redirect_to books_path, success: "お気に入りに追加しました"
    else
      flash.now[:danger] = "お気に入りに追加できませんでした"
    end
  end

  private  

  def book_params
    params.require(:book).permit(:title, :sumbnail_url, :published_date, :isbn)
  end
  
  def authors_params
    params.require(:book).permit(authors: [])
  end
end
