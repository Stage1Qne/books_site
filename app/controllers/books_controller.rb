class BooksController < ApplicationController
  def index
    # @books = Book.all
    @books = Book.order(:name).page params[:page]
  end

  def show
    @book = Book.find(params[:id])
  end
end
