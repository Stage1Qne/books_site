class Admin::AuthorsController < Admin::BaseController

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new

    respond_to do |format|
      format.html
      format.json { render json: @author }
    end
  end

  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to @author, notice: 'Author was successfully created.' }
        format.json { render json: @author, status: :created, location: @author }
      else
        format.html { render action: "new" }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def author_params
    params.require(:author).permit(:full_name)
  end

end
