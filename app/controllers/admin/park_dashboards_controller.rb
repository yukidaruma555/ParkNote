class Admin::ParkDashboardsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @parks = Park.all
  end

end
