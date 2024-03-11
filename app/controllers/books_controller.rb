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

  def create
    @book = current_user.books.build(book_params)
    if @book.save_with_author(authors_params[:authors])
      redirect_to books_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
    end
  end

  private  

  def book_params
    params.require(:book).permit(:title, :image_link, :info_link, :published_date, :systemid)
  end
  
  def authors_params
    params.require(:book).permit(authors: [])
  end
end
