class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      
      t.string :name
      t.string :pos
      t.string :team
      t.float :war

      t.timestamps null: false
    end
  end
end
