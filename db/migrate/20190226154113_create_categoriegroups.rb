class CreateCategoriegroups < ActiveRecord::Migration[5.0]
  def change
    create_table :categoriegroups do |t|
      t.references :item, foreign_key: true
      t.references :categorie, foreign_key: true

      t.timestamps
    end
  end
end
