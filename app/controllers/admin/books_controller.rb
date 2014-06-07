class Admin::BooksController < Admin::BaseController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @authors = Author.all.collect {|a| [a.full_name, a.id]}

    respond_to do |format|
      format.html
      format.json { render json: @book }
    end
  end

  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render json: @book, status: :created, location: @book }
      else
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :author_id, :series, :publisher, :year, :pages, :binding, :format, :isbn, :weight, :decription)
  end

end
