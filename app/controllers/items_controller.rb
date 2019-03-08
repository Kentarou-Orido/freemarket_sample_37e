class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:completed_purchase]

  def index
    @categories = Category.find([1,2,3,4])
    @brands = Brand.all.includes(:items)
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

end
