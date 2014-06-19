class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

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

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:email, :full_name, :parent_id, :content, :avatar)
    end
end
