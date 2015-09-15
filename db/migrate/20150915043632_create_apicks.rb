class CreateApicks < ActiveRecord::Migration
  def change
    create_table :apicks do |t|
      t.integer :draft_setting_id
      
      t.timestamps null: false
    end
  end
end
