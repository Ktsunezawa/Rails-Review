class BookCommentsController < ApplicationController

  def create
    @book_comment = BookCommnet.new(book_comment_params)
    @book_comment.save
    redirect_to book_path
  end

  def destroy
    book_comment = BookComment.find(params[:id])
    book_comment.destroy
    redirect_to book_path
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
