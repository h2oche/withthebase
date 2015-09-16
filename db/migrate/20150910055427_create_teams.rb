class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      
      t.integer :user_id
      t.integer :room_id
      t.string :name

      t.timestamps null: false
    end
  end
end
