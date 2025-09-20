class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @park = @user.parks
  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    user = current_user
    user.destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path
    end
  end
  
end
