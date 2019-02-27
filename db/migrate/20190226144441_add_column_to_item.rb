class AddColumnToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :delivery_date, :integer, null: false
    add_column :items, :delivery_burden, :integer, null: false
  end
end
