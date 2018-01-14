class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.decimal :score
      t.references :contest, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
