class BooksController < ApplicationController

  def index
    @books = Book.all.includes([:authors, :user]).order(created_at: :desc)
    @book = current_user.books.includes([:authors, :user]).order(created_at: :desc)
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save_with_author(authors_params[:authors])
      redirect_to books_path, success: "お気に入りに追加しました"
    else
      flash.now[:danger] = "お気に入りに追加できませんでした"
    end
  end

  def search
    @book = Book.new
    @volume_info = params[:volumeInfo]
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

  private  

  def book_params
    params.require(:book).permit(:title, :image_link, :published_date, :systemid)
  end
  
  def authors_params
    params.require(:book).permit(authors: [])
  end
end
