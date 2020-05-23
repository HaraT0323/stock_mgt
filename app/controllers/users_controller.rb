class UsersController < ApplicationController
  def index
    @user = User.new
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    @users = User.all
    if @user.save
      flash[:notice] = "ユーザーを作成しました。"
      redirect_to users_path
    else
      render "index"
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user.destroy
      redirect_to users_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name)
  end
end
