class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      
      t.integer :player_id
      t.integer :win
      t.integer :strikeout
      t.integer :savehold
      t.float :era
      t.date :record_date

      t.timestamps null: false
    end
  end
end
