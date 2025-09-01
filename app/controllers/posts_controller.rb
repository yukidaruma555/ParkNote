class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id 
    @post.rating = 5.0 #TODO
    @post.save!
      redirect_to posts_path
  end 

  def index
    @posts = Post.all
  end

  def show

  end

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :body, :park_id, :rating)
  end

end
