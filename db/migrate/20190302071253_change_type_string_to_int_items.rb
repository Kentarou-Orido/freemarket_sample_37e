class ChangeTypeStringToIntItems < ActiveRecord::Migration[5.0]
  def change
    change_column :items, :area, :integer
  end
end

