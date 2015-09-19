class AddUsernameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :teams, :win, :integer
    add_column :teams, :lose, :integer
  end
end
