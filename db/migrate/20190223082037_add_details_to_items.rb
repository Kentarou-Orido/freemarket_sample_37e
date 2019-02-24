class AddDetailsToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :delivery_method, :integer
    add_column :items, :delivery_burden, :integer
  end
end
