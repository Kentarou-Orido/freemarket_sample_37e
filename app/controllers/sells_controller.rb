class SellsController < ApplicationController

  before_action :set_item, only: [:edit]

  def show
    @item = Item.new
    @categoryroot = Category.where(ancestry: "0")
    @item.images.build
  end

  def create
    @item = Item.new(sell_params)
    if @item.save
    else
      redirect_to sell_path, flash: {miss: "必須項目をすべて選択してください"}
    end
  end

  def edit
  end

  def update
    if @item.update(sell_params)
      redirect_to ""
    else
      render :edit
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def sell_params
    params.require(:item).permit(:name, :price, :trade_status, :item_condition, :delivery_burden, :area, :shipping_method, :delivery_date, :size, :text, {:category_ids => []}, images_attributes: [:image_url], brand_attributes: [:name]).merge(seller: current_user)
  end

end
