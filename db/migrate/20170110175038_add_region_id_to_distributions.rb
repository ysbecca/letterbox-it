class AddRegionIdToDistributions < ActiveRecord::Migration[5.0]
  def change
  	add_column :distributions, :region_id, :integer
  end
end
