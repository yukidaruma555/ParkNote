class Public::ParksController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def new
    @park = Park.new
  end

  def create
    @park = Park.new(park_params)
    @park.user_id = current_user.id
    if @park.save
    redirect_to parks_path(park_id: @park.id), notice: "公園を登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end 

  def index
    @parks = Park.includes(:park_equipments, :park_facilities, :age_groups).all
    @parks = @parks.where('park_equipments.equipment_id': params[:equipment_ids]) if params[:equipment_ids]&.compact_blank.present?
    @parks = @parks.where('park_facilities.facility_id': params[:facility_ids]) if params[:facility_ids]&.compact_blank.present?
    @parks = @parks.where('park_age_groups.age_group_id': params[:age_group_ids]) if params[:age_group_ids]&.compact_blank.present?
  end
  def show
    @park = Park.find(params[:id])
    @post = Post.new
    @posts = @park.posts.order(created_at: :desc)
    @user = @park.user
  end

  def edit
  end

  def update
    if @park.update(park_params)
     flash[:notice] = "編集しました"
    redirect_to park_path(@park.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @park.posts.exists?
      redirect_to @park, alert: "投稿があるため削除できません。"
      return
    end

    if @park.destroy
     flash[:notice] = "削除しました"
     redirect_to parks_path
    else
      redirect_to @park, alert: @park.errors.full_messages.to_sentence
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

  def correct_user
    @park = current_user.parks.find_by(id: params[:id])
    redirect_to root_path unless @park

    #上と同じ結果になるコード
    #@park = Park.find_by(id: params[:id])
    #user = @park.user
    #if current_user != user
    #  redirect_to root_path
    #end
  end
end
