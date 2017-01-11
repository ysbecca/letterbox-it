class RegionsToUsers < ActiveRecord::Migration[5.0]
  def change
  	create_table :regions_to_users, :id => false do |t|
  		t.integer :region_id
  		t.integer :user_id
  	end
  end
end
