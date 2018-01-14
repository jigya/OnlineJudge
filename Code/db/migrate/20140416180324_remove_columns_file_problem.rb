class RemoveColumnsFileProblem < ActiveRecord::Migration
  def change
      remove_column :problems, :problem_statement
      remove_column :problems, :solution_file
      remove_column :problems, :test_file
  end
end
