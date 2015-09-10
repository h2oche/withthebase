class CreateBats < ActiveRecord::Migration
  def change
    create_table :bats do |t|
      
      t.integer :player_id
      t.float :bat_avg
      t.integer :rbi
      t.integer :homerun
      t.integer :steal
      t.integer :error
      t.date :record_date

      t.timestamps null: false
    end
  end
end
