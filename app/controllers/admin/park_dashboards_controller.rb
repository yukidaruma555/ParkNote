class Admin::ParkDashboardsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @parks = Park.all
  end

  def show
    @park = Park.find(params[:id])
    @posts = @park.posts
  end

  def edit
    @park = Park.find(params[:id])
  end

  def update
    @park = Park.find(params[:id])
    if @park.update(park_params)
    redirect_to admin_park_dashboard_path(@park), notice: "編集しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    
    if @park.posts.exists?
      redirect_to admin_park_dashboards_path, alert: "投稿があるため削除できません。"
      return
    end

    if @park.destroy
     flash[:notice] = "削除しました"
     redirect_to admin_park_dashboards_path, notice: "削除しました"
    else
      redirect_to admin_park_dashboard_path(@park), alert: @park.errors.full_messages.to_sentence
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
end
