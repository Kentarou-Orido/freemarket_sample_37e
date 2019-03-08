class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:completed_purchase]
  before_action :checking_login, only: [:purchase]

  def index
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

  def checking_login
    redirect_to new_user_session_path, notice: "この画面はログインしてからご覧になれます" unless user_signed_in?
  end
end
