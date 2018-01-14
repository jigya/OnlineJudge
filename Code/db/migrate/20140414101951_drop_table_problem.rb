class DropTableProblem < ActiveRecord::Migration
  def change
      drop_table:problems
      drop_table:questions
  end
end
