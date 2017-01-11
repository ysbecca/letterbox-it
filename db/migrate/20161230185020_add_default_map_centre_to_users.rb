class AddDefaultMapCentreToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :default_map_centre, :string
  end
end
