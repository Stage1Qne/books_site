class Admin::CommentsController < Admin::BaseController
  authorize_resource
  def index
    @comments = Comment.not_moderated
  end

  def show
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(params[:comment].permit(:full_name, :email, :content,
                                   :parent_id, :book_id, :avatar))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to book_path(@comment.book_id), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to admin_comments_path, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment=Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to admin_comments_path, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:email, :full_name, :parent_id, :content, :avatar, :moderated)
    end
end
