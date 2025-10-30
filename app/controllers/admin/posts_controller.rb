class Admin::PostsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def destroy
    post = Post.find(params[:id])
    user = post.user   
    post.destroy
    redirect_to admin_user_path(user), notice: '投稿を削除しました。'
  end
end
