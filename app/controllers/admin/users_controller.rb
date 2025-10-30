class Admin::UsersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :destroy]


  def index
    @users = User.all
  end

  def show
    @posts = @user.posts.includes(:user).order(created_at: :desc)
    @parks = @user.parks if defined?(@user.parks)
  end

  def destroy
     @user.destroy 
     redirect_to admin_users_path, notice: 'ユーザーを削除しました。' 
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
