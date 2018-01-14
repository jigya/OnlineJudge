class AddChangeOccupationInUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :occupation, :string
  	add_column :users, :occupation, :string, :null=>false, :default=>"Student"
  end
end
