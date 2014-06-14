class BooksController < ApplicationController
  def index
    # @books = Book.all
    @books = Book.order(:name).page params[:page]
  end

  def show
    @book = Book.find(params[:id])
    @comment = Comment.new(book_id: @book.id)
  end
end
