class ChangeDefaultMapCentreToDefaultRegion < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :default_map_centre, :default_region
  end
end
