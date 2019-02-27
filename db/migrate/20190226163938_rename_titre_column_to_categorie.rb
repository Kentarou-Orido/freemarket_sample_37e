class RenameTitreColumnToCategorie < ActiveRecord::Migration[5.0]
  def change
    rename_column :categoriegroups, :categorie_id, :category_id
  end
end
