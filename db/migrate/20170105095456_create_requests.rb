class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.string :city
      t.string :country
      t.text :comments

      t.timestamps
    end
  end
end
