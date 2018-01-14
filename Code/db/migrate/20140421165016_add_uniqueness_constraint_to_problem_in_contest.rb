class AddUniquenessConstraintToProblemInContest < ActiveRecord::Migration
  def change
  	add_index :problem_in_contests, [:problem_id, :contest_id], unique: true
  end
end
