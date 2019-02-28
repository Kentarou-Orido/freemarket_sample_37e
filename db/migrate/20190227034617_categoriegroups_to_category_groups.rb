class CategoriegroupsToCategoryGroups < ActiveRecord::Migration[5.0]
  def change
    rename_table :categoriegroups, :categories_groups
  end
end
