class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      
      t.integer :room_id
      t.date :game_date
      t.integer :team1
      t.integer :team2
      t.string :result

      t.timestamps null: false
    end
  end
end
