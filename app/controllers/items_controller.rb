class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:purchase,:completed_purchase]
  before_action :set_image, only: [:show,:purchase]

  def index
  end

  def show
    @seller = @item.seller
    @brand = Brand.find(@item.brand_id)
    @categories = @item.categories
    @saling_items = Item.where(seller_id: @item.seller_id).where.not(id: @item.id)
    @other_items = @categories[-1].items.where(brand_id: @item.brand_id).where.not(id: @item.id)
  end

  def purchase
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
      # 本当はcurrent_user.id
      @item.update!(buyer_id: 1)
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_image
    @images = @item.images
  end
end

