class ItemsController < ApplicationController


  def index

    @items = Item.all
    @categories = Category.all
    # binding.pry

  end

  def show
  end

  def buy
  end
end
