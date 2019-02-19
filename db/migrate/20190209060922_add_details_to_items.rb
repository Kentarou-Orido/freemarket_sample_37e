class AddDetailsToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :seller,null:false
    add_reference :items, :buyer
  end
end
