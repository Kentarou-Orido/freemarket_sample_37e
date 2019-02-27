class AddColumnUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :rate_good, :integer, default: 0
    add_column :users, :rate_normal, :integer, default: 0
    add_column :users, :rate_bad, :integer, default: 0
  end
end
