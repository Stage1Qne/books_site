class Admin::BooksController < Admin::BaseController

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
    @authors = Author.all.collect {|a| [a.full_name, a.id]}
    @author = Author.new

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
        format.json { render json: @book.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @book=Book.find(params[:id])
    @authors = Author.all.collect {|a| [a.full_name, a.id]}
    @author = Author.find(@book.author_id)
  end

  def show
    @book=Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to admin_books_path, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_controllers/1
  # DELETE /post_controllers/1.json
  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    respond_to do |format|
      format.html { redirect_to admin_books_path, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def book_params
    params.require(:book).permit(:name, :author_id, :series, :publisher, :year, :pages, :binding, :format, :isbn, :weight, :decription, :cover)
  end

end
