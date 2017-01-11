class RenameRegionsToUsers < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :regions_to_users, :regions_users
  end

  def self.down
    rename_table :regions_to_users, :regions_users
  end
end
