class AddCountryToRegions < ActiveRecord::Migration[5.0]
  def change
    add_column :regions, :country, :string
  end
end
