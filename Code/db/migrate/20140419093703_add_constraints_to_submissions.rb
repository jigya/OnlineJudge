class AddConstraintsToSubmissions < ActiveRecord::Migration
  def change
  	change_column :submissions, :languageUsed, :string, :null=>false, :default=>"C++"
  	change_column :submissions, :timeTaken, :decimal, :default=>0.0
  	change_column :submissions, :memoryUsed, :decimal, :default=>0.0
  	change_column :submissions, :status, :text, :default=>"0"
  	change_column :submissions, :submissionFile, :text, :default=>"", :null=>false
  	remove_column :problems, :username
  	change_column :users, :username, :string, :null=>false, :default=>""
  	change_column :users, :name, :string, :null=>false, :default=>""
  	change_column :users, :ranking, :decimal, :null=>false, :default=>0
  	change_column :contests, :contestName, :string, :null=>false, :default=>""
  	change_column :contests, :contestName, :string, :null=>false, :default=>""
  	change_column :contests, :startDateTime, :datetime, :null=>false
  	change_column :contests, :endDateTime, :datetime, :null=>false
  	change_column :participants, :score, :decimal, :default=>0

  end
end
