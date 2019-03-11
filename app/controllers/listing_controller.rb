class ListingController < ApplicationController

  def index
    @items =  Item.where(seller_id: current_user.id).page(params[:page]).per(5).order("created_at DESC")
  end

  private

end
