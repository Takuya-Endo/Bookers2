class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])

    @profile_image = ProfileImage.new

  end

  def update
    user = User.find(params[:id])
    user.update(user_params)

    profile_image = ProfileImage.new(profile_image_params)
    profile_image.user_id = currenr_user.id
    profile_image.save

    redirect_to user_path(user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image_id, :introduction)
    params.require(:profile_image).permit(:image_id, :user_id)
  end

end