class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :postcode,         null:false
      t.string  :prefectures,       null:false
      t.string  :municipality,      null:false
      t.string  :street_number,     null:false
      t.string  :building_name
      t.timestamps
    end
  end
end
