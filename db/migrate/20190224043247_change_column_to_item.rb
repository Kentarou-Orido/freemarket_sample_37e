class ChangeColumnToItem < ActiveRecord::Migration[5.0]
  def up
    change_column :items, :delivery_method, :string, null: false, limit: 255
    change_column :items, :delivery_burden, :string, null: false, limit: 255
  end
end
