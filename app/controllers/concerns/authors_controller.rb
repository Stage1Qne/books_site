class AuthorsController < ApplicationController
  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    @author.save
  end

  private

  def author_params
    params.require(:author).permit(:full_name)
  end
end
