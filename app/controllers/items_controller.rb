class ItemsController < ApplicationController


  def index

    @items = Item.all
    @categories = Category.find([1,2,3,4])


  end

  def show
  end

  def buy
  end
end
