class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :languageUsed
      t.datetime :dateTimeOfSubmission
      t.decimal :timeTaken
      t.decimal :memoryUsed
      t.text :submissionFile
      t.text :status
      t.references :user, index: true
      t.references :problem, index: true
      t.references :contest, index: true

      t.timestamps
    end
  end
end
