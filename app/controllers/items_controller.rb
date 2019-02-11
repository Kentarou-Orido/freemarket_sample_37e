class ItemsController < ApplicationController

  def index
    # binding.pry
    # item = Item.find(params[:id])
    # @category = item.categories
  end

  def show
  end

  private
    def item_params
      params.require(:item).permit(:name)
    end
end
