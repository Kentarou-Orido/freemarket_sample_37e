class AddDetailsToAddresses < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :room_number, :integer
    add_column :addresses, :remarks, :text
    add_reference :addresses, :user, null: false, foreign_key: { to_table: :users }
  end
end
