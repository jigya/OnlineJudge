class AddInstitutionToUser < ActiveRecord::Migration
  def change
    add_column :users, :institution, :text
  end
end
