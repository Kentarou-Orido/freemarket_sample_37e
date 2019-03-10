class ListingController < ApplicationController

  def index
    @items =  Item.where(seller_id: 1).page(params[:page]).per(5).order("created_at DESC")
  end

  private

end
