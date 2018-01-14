class RemoveProbStatFromProblem < ActiveRecord::Migration
  def change
  	remove_column :problems, :problem_statement_file_name
  	remove_column :problems, :problem_statement_content_type
  	remove_column :problems, :problem_statement_file_size
  	remove_column :problems, :problem_statement_updated_at
  	add_column :problems, :problem_statement, :text
  end
end
