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
    @park = Park.all
  end

  def show
  end

  def edit
  end

  private

  def park_params
    params.require(:park).permit(:park_name, :image, :introduction, :postal_code, :address)
  end
end
