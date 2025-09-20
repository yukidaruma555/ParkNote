class PostsController < ApplicationController
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id 
    @post.rating = post_params["rating"]
    if @post.save
     redirect_to park_path(@post.park_id)
    else
      @park = Park.find(@post.park_id)
      @posts = @park.posts.order(created_at: :desc)
      @user = @park.user
      render 'parks/show'
    end
  end 

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
    redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to user_path(post.user), notice: "投稿を削除しました"
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :body, :park_id, :rating)
  end

end
