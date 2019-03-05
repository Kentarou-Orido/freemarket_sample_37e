class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:completed_purchase]
  before_action :set_brand


  def index
    @items= Item.all
    @categories = Category.find([1,2,3,4])
    @brands = Brand.find([1,2,3,4])
    # @brand = Brand.where(id: params[:id])
    @items = @brand.items
    binding.pry
  end

  def show
  end

  def purchase
    @item = Item.find(params[:format])
  end

  def completed_purchase
    ActiveRecord::Base.transaction do
      require 'payjp'
      Payjp.api_key = Rails.application.secrets.PAYJP_SECRET_KEY
      Payjp::Charge.create(
        amount:  @item.price,
        card:    params['payjp-token'],
        currency: 'jpy',
      )
      @item.update!(buyer_id: 1)
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_brand
    @brand = Brand.where(params[:id])
  end
end
