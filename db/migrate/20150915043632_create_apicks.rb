class CreateApicks < ActiveRecord::Migration
  def change
    create_table :apicks do |t|

      t.timestamps null: false
    end
  end
end
