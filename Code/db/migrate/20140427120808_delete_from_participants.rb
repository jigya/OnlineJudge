class DeleteFromParticipants < ActiveRecord::Migration
  def change
  	remove_column :participants, :score
  end
end
