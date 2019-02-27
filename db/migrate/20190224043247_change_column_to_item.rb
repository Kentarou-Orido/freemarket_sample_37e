class ChangeColumnToItem < ActiveRecord::Migration[5.0]
  def up
    change_column :items, :delivery_method, :string, null: false
    change_column :items, :delivery_burden, :string, null: false
    remove_reference :items, :user, foreign_key: true
  end
end
