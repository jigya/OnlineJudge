class AddAttachmentProblemStatementToProblems < ActiveRecord::Migration
  def self.up
    change_table :problems do |t|
      t.attachment :problem_statement
    end
  end

  def self.down
    drop_attached_file :problems, :problem_statement
  end
end
