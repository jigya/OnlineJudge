class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :contestName
      t.datetime :startDateTime
      t.datetime :endDateTime
      t.string :contestStatus
      t.references :user, index: true

      t.timestamps
    end
  end
end
