class SellsController < ApplicationController

  def show
    @item = Item.new
    @item.images.build
  end

  def create
    @item = Item.new(sell_params)
    binding.pry
    @item.save
  end

  private
  def sell_params
    params.require(:item).permit(:name, :price, :trade_status, :item_condition, :delivery_burden, :area, :shipping_method, :delivery_date, :size, :text, {:category_ids => []}, images_attributes: [:image_url]).merge(seller: User.find(1))
  end

end
