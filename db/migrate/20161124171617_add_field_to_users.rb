class AddFieldToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :username, :string, :unique => true
  end
end
