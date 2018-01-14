class AddUniqueConstraint < ActiveRecord::Migration
  def change
  	add_index :contests, [:contestName, :startDateTime], unique: true
  	add_index :users, [:username], unique: true
  	add_index :problems, [:title], unique: true
  end
end
