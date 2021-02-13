class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to user_path(user.id)  # 後でbooks#showへリダイレクト先を変更
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

end