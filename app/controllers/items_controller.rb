class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:purchase,:completed_purchase, :edit]
  before_action :set_image, only: [:show,:purchase, :edit]
  before_action :checking_login, only: [:purchase]
  before_action :set_user, only: [:purchase, :destroy]
  before_action :checking_user_want_to_see_for_my_item, only: [:show, :purchase]
  before_action :verification_address, only: [:purchase]

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
    @other_uesr_items = Item.where(seller_id: @item.seller_id).where.not(id: @item.id)
    @brand_category_items = @categories[-1].items.where(brand_id: @item.brand_id,buyer_id: nil).where.not(id: @item.id)
  end

  def edit
    @seller = @item.seller
    @brand = Brand.find_by_id(@item.brand_id)
    @categories = @item.categories
    @other_uesr_items = Item.where(seller_id: @item.seller_id).where.not(id: @item.id)
    @brand_category_items = @categories[-1].items.where(brand_id: @item.brand_id,buyer_id: nil).where.not(id: @item.id)
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

  def destroy
    @item = Item.find(params[:id])
    @item.destroy if @item.seller_id == current_user.id
    redirect_to user_listing_index_path(@user)
  end

  private

  def checking_user_want_to_see_for_my_item
    if user_signed_in?
      redirect_to edit_item_path(@item) if current_user.id == @item.seller.id
    end
  end

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

  def verification_address
    finding_address = @user.addresses
    redirect_to new_user_address_path(@user), notice: "#{current_user.nickname}様はお届け先住所が登録されていません。お届け先住所の入力は必須ですので、ご登録ください" unless finding_address.exists?
  end
end
