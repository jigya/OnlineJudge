class DeleteConteststatusFromContest < ActiveRecord::Migration
  def change
  	remove_column :contests, :contestStatus, :string
  end
end
