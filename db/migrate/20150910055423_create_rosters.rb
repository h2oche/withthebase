class CreateRosters < ActiveRecord::Migration
  def change
    create_table :rosters do |t|
      
      t.integer :team_id
      t.integer :player_id
      t.string :state

      t.timestamps null: false
    end
  end
end
