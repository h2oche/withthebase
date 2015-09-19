class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      
      t.string :name
      t.integer :admin_id
      t.string :emblem
      
      
      
      t.boolean :is_classic_mode
      t.boolean :is_public_mode
      t.string :password
      t.integer :period
      t.datetime :draft_time
      t.integer :size_limit
      t.integer :draft_time_limit

      t.timestamps null: false
    end
  end
end
