class UsersController < ApplicationController
  def index
  	@user = User.find(current_user.id)
  	@users = User.all
  end

  def show
  end

  def edit
  	@user = User.find(current_user.id)
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
