class RemoveItemIdFromCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :item_id, :integer
  end
end
