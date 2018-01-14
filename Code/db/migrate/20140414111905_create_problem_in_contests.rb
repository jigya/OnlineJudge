class CreateProblemInContests < ActiveRecord::Migration
  def change
    create_table :problem_in_contests do |t|
      t.references :problem, index: true
      t.references :contest, index: true

      t.timestamps
    end
  end
end
