class ListingController < ApplicationController

  before_action :set_user

  def index
    @items = @user.items.page(params[:page]).per(5).order("created_at DESC")
  end

  private
  def set_user
    @user = current_user
  end

end
