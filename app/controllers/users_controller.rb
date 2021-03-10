class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  private
  def index_params
    params.require(:user).permit(:username)
  end
end
