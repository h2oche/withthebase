class CreateApickSettings < ActiveRecord::Migration
  def change
    create_table :apick_settings do |t|
      t.integer :order
      t.integer :apick_id

      t.timestamps null: false
    end
  end
end
