class Admin::ParksController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  before_action :set_park, only: [:show, :edit, :update, :destroy]

  def index
    @parks = Park.all
  end

  def show
    @posts = @park.posts
  end

  def edit
  end

  def update
    if @park.update(park_params)
    redirect_to admin_park_path(@park), notice: "編集しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @park.destroy
      redirect_to admin_parks_path, notice: '公園を削除しました。'
    else
      flash[:alert] = '投稿が存在するレコードは削除できません。'
      redirect_to admin_park_path(@park)
    end
  end

  private

  def park_params
    params.require(:park).permit(
      :park_name, :image, :introduction, :postal_code, :address,
      equipment_ids: [],
      facility_ids: [],
      age_group_ids: [])
  end

  def set_park
    @park = Park.find(params[:id])
  end  

end
