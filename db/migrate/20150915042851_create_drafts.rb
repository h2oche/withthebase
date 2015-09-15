class CreateDrafts < ActiveRecord::Migration
  def change
    create_table :drafts do |t|
      t.integer :time_limit
      t.boolean :is_complete
      t.integer :room_id
      
      t.timestamps null: false
    end
  end
end
