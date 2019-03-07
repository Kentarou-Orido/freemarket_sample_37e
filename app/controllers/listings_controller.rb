class ListingsController < ApplicationController

  def show
    user = User.find(params[:id])
    @items = user.items.page(params[:page]).per(5).order("created_at DESC")
  end

end
