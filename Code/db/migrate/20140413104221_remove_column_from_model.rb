class RemoveColumnFromModel < ActiveRecord::Migration
  def change
      remove_column :users, :add_dateOfBirth_to_users
      remove_column :users, :add_country_to_users
      remove_column :users, :add_aboutMe_to_users
      remove_column :users, :accountStatus
      remove_column :users, :add_ranking_to_users
      remove_column :users, :add_institution_to_users
      remove_column :users, :institution
      
  end
end
