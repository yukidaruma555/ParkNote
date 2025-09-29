class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id 
    @post.rating = post_params["rating"]
    if @post.save
     redirect_to park_path(@post.park_id), notice: "投稿が成功しました！"
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
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "編集しました"
    redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
     flash[:notice] = "削除しました"
    redirect_to user_path(post.user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :image, :body, :park_id, :rating)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_path unless @posts 
  end
end
