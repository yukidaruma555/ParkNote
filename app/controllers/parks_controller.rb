class ParksController < ApplicationController
  def new
    @park = Park.new
  end

  def create
    @park = Park.new(park_params)
    @park.user_id = current_user.id
    @park.save
    redirect_to parks_path
  end 

  def index
    @parks = Park.all
  
  end

  def show
    @park = Park.find(params[:id])
    @post = Post.new
    @posts = @park.posts.order(created_at: :desc)
    @user = @park.user
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    park = Park.find(params[:id])
    park.update(park_params)
    redirect_to park_path(park.id)
  end

  def destroy
    park = Park.find(params[:id])
    park.destroy
    redirect_to parks_path
  end

  private

  def park_params
    params.require(:park).permit(
      :park_name, :image, :introduction, :postal_code, :address,
      equipment_ids: [],
      facility_ids: [],
      age_group_ids: [])
  end
end
