class Change2ColumnToItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :delivery_date
    remove_column :items, :delivery_burden
    remove_column :items, :trade_status
    remove_column :items, :postage
  end
end
