class ChangeDefaultRegionType < ActiveRecord::Migration[5.0]
  def up
  	execute 'ALTER TABLE users ALTER COLUMN default_region TYPE integer USING (default_region::integer)'
  end

  def down
  	execute 'ALTER TABLE users ALTER COLUMN default_region TYPE string USING (default_region::string)'
  end
end
