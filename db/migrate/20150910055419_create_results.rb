class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      
      t.integer :team_id
      
      t.integer :win
      t.integer :strikeout
      t.integer :savehold
      t.float :era
      
      t.float :bat_avg
      t.integer :rbi
      t.integer :homerun
      t.integer :steal
      t.integer :error

      t.timestamps null: false
    end
  end
end
