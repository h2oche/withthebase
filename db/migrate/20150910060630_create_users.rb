class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      
      t.integer :person_id
      t.string :account
      t.string :password
      t.string :email
      t.string :name

      t.timestamps null: false
    end
  end
end
