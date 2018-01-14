class AddColumnsToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :problem_statement, :text
    add_column :problems, :solution_file, :text
    add_column :problems, :test_file, :text
  end
end
