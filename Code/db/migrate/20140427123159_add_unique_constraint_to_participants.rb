class AddUniqueConstraintToParticipants < ActiveRecord::Migration
  def change
  	add_index :participants, [:contest_id, :user_id], unique: true
  end
end
