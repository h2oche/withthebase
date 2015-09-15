class CreateDraftSettings < ActiveRecord::Migration
  def change
    create_table :draft_settings do |t|
      t.integer :order
      t.boolean :applied

      t.timestamps null: false
    end
  end
end
