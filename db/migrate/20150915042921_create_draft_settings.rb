class CreateDraftSettings < ActiveRecord::Migration
  def change
    create_table :draft_settings do |t|
      t.integer :order
      t.boolean :applied
      t.integer :draft_id
      t.integer :team_id

      t.timestamps null: false
    end
  end
end
