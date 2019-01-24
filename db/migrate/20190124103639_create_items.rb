class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string     :name,             null:false
      t.integer    :price,            null:false
      t.references :user,             null:false, foreign_key: true
      t.integer    :trade_status,     null:false
      t.integer    :item_condition,   null:false
      t.string     :postage,          null:false
      t.string     :area,             null:false
      t.integer    :shipping_method,  null:false
      t.string     :size
      t.text       :text,             null:false
      t.timestamps
    end
  end
end
