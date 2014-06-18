class Admin::AuthorsController < Admin::BaseController
  authorize_resource
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
        format.json { render json: @author.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  def show
    @author = Author.find(params[:id])
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to admin_authors_path, notice: 'author was successfully updated.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit }
        format.json { render json: @author.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_controllers/1
  # DELETE /post_controllers/1.json
  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    respond_to do |format|
      format.html { redirect_to admin_authors_path, notice: 'author was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def author_params
    params.require(:author).permit(:full_name, :avatar)
  end

end
