class Public::FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_or_create_by(post_id: post.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end

end