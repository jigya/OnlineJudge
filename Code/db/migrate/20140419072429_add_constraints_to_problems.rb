class AddConstraintsToProblems < ActiveRecord::Migration
  def change
  	change_column :problems, :title, :string, :null=>false, :default=>""
  	change_column :problems, :timeLimit, :decimal, :null=>false, :default=>2
  	change_column :problems, :sourceLimit, :decimal, :null=>false, :default=>50000
  	change_column :problems, :problem_statement, :text, :null=>false, :default=>""
  end
end
