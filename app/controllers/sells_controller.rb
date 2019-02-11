class SellsController < ApplicationController

  def show
    @item = Item.new
    @item.images.build
    @item.categories.build
  end

  def create
    @item = Item.create(sell_params)
  end

  private
  def sell_params
    params.require(:item).permit(:name, :price, :trade_status, :item_condition, :postage, :area, :shipping_method, :size, :text, image_attributes: [:image_url], category_attributes: [:name]).merge(user_id: current_user.id)
  end

end
