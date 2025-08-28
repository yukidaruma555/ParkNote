class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id 

    if @post.save
      redirect_to posts_path
    else
      flash[:error] = "投稿の保存に失敗しました。"
      render 'new'
    end
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
    params.require(:post).permit(:title, :image, :body, :park_id)
  end

end
