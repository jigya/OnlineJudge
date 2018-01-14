class AddAttachmentTestFileToProblems < ActiveRecord::Migration
  def self.up
    change_table :problems do |t|
      t.attachment :test_file
    end
  end

  def self.down
    drop_attached_file :problems, :test_file
  end
end
