class RemoveItemFromBrands < ActiveRecord::Migration[5.0]
  def change
    remove_reference :brands, :item, foreign_key: true
  end
end
