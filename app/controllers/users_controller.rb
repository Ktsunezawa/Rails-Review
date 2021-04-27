class UsersController < ApplicationController

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
       redirect_to books_path
    else
      render new
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduce, :profile_image)
  end

end
