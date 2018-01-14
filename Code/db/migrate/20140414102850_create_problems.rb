class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :title
      t.decimal :timeLimit
      t.decimal :sourceLimit
      t.date :dateAdded
      t.text :problemStatement
      t.text :solutionFile
      t.text :testFile

      t.timestamps
    end
  end
end
