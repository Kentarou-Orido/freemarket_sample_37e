class SellsController < ApplicationController

  before_action :set_item, only: [:edit, :update]

  def index
    @item = Item.new
    @categoryroot = Category.where(ancestry: "0")
    @item.images.build
  end

  def create
    @item = Item.new(sell_params)
    if @item.save
    else
      redirect_to sells_path, flash: {miss: "必須項目をすべて選択してください"}
    end
  end

  def edit
    @categoryroot = Category.where(ancestry: "0")
  end

  def update
    if @item.update(update_params)
      redirect_to edit_item_path(@item)
    else
      @categoryroot = Category.where(ancestry: "0")
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

  def update_params
    params.require(:item).permit(:name, :price, :trade_status, :item_condition, :delivery_burden, :area, :shipping_method, :delivery_date, :size, :text, {:category_ids => []}, images_attributes: [:image_url, :_destroy, :id], brand_attributes: [:name]).merge(seller: current_user)
  end

end
