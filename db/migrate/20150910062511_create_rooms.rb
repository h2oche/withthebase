class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      
      t.string :name
      t.string :adminid
      t.string :room_pw
      t.string :mode
      t.integer :size

      t.timestamps null: false
    end
  end
end
