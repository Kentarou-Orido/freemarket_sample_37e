class RenameDeliveryMethodColumnToItem < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :delivery_method, :delivery_date
  end
end
