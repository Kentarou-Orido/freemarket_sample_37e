class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:purchase,:completed_purchase, :edit]
  before_action :set_image, only: [:show,:purchase, :edit]
  before_action :checking_login, only: [:purchase]
  before_action :set_user, only: [:purchase]

  def index
    @categories = Category.find([1,2,3,4])
    @brands = Brand.find([1,2,3,4])
  end

  def create
  end

  def show
    @seller = @item.seller
    @brand = Brand.find_by_id(@item.brand_id)
    @categories = @item.categories
    @other_uesr_items = Item.where(seller_id: @item.seller_id).where.not(id: @item.id).limit(6)
    @brand_category_items = @categories[-1].items.where(brand_id: @item.brand_id,buyer_id: nil).where.not(id: @item.id)
  end

  def edit
    @seller = @item.seller
    @brand = Brand.find_by_id(@item.brand_id)
    @categories = @item.categories
    @other_uesr_items = Item.where(seller_id: @item.seller_id).where.not(id: @item.id).limit(6)
    @brand_category_items = @categories[-1].items.where(brand_id: @item.brand_id,buyer_id: nil).where.not(id: @item.id)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy if item.seller_id == current_user.id
  end

  def purchase
    @address = @user.addresses[0]
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
      @item.update!(buyer_id: current_user.id)
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_image
    @images = @item.images
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def checking_login
    redirect_to new_user_session_path, notice: "この画面はログインしてからご覧になれます" unless user_signed_in?
  end
end
