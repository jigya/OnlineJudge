class AddForeignToConstraints < ActiveRecord::Migration
  def change
  	add_foreign_key :problems, :users
  end
end
