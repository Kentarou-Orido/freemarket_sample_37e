class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.references :user,             null:false, foreign_key: true
      t.string     :name,             null:false
      t.integer    :card_number,      null:false
      t.date       :expiration_date,  null:false
      t.integer    :security_code,    null:false
      t.timestamps
    end
  end
end
