class Change2ColumnToItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :delivery_date, :string
    remove_column :items, :delivery_burden, :string
    remove_column :items, :trade_status, :integer
    remove_column :items, :postage, :string
  end
end
