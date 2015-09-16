class CreateDraftResults < ActiveRecord::Migration
  def change
    create_table :draft_results do |t|
      t.integer :team_id
      t.integer :player_id
      t.integer :round
      t.integer :draft_id
      
      t.timestamps null: false
    end
  end
end
