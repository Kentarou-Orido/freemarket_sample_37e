class AddCategoriesToCategoryIds < ActiveRecord::Migration[5.0]
  def change
    add_reference :categories, :item, null:false
  end
end
