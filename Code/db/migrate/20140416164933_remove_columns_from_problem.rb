class RemoveColumnsFromProblem < ActiveRecord::Migration
  def change
      remove_column :problems, :problem_statement_file_name
      remove_column :problems, :problem_statement_content_type
      remove_column :problems, :problem_statement_file_size
      remove_column :problems, :problem_statement_updated_at
      remove_column :problems, :solution_file_file_name
      remove_column :problems, :solution_file_content_type
      remove_column :problems, :solution_file_file_size
      remove_column :problems, :solution_file_updated_at
      remove_column :problems, :test_file_file_name
      remove_column :problems, :test_file_content_type
      remove_column :problems, :test_file_file_size
      remove_column :problems, :test_file_updated_at
  end
end
