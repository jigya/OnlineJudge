class AddAuthorIdToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :username, :string
  end
end
