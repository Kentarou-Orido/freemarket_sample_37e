class ItemsController < ApplicationController

  def index
  end

  def show
    @item = Item.find(params[:id])

  end

  def purchase
    @item = Item.find(params[:format])
   end

  def completed_purchase
    @item = Item.find(params[:id])
    require 'payjp'
    Payjp.api_key = PAYJP_SECRET_KEY

    Payjp::Charge.create(
      amount:  @item.price,
      card:    params['payjp-token'],
      currency: 'jpy',
    )
    @item.update!(buyer_id: '1')
    binding.pry
  end
end
