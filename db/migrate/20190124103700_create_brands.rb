class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string     :name
      t.references :item,    null:false, foreign_key: true
    end
  end
end
