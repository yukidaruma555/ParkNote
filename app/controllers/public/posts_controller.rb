class Public::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def create
    @post = current_user.posts.new(post_params)
    @park = @post.park
    if @post.save
      redirect_to park_path(@park), notice: "投稿が成功しました！"
    else
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
    @park = @post.park
    @post_comment = PostComment.new
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
    redirect_to root_path unless @post 
  end
end
