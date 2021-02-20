class BooksController < ApplicationController

  def index
    @books = Book.all
    @user = User.find(current_user.id)
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
    @user = User.find(current_user.id)

    if @book.save
      redirect_to book_path(@book.id)
    else
      render :index
    end

  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(current_user.id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])

    book.update(book_params)
    redirect_to book_path(@book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
