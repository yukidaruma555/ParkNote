class Public::HomesController < ApplicationController
  def top
    redirect_to current_user if user_signed_in?
  end

  def about
  end
end
