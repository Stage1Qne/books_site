class BooksController < ApplicationController
  def index
    if params[:query].present?
      @books = Book.search(params[:query], page: params[:page])
    else
      @books = Book.order(:name).page params[:page]
    end
  end

  def show
    @book = Book.find(params[:id])
    @comment = Comment.new(book_id: @book.id)
    @author_books = Book.where(:author_id => @book.author.id)
  end
end
