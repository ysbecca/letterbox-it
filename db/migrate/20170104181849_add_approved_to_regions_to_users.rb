class AddApprovedToRegionsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :regions_to_users, :approved, :boolean
    add_column :regions_to_users, :approval_date, :date
    add_column :regions_to_users, :admin_id, :integer
  end
end
