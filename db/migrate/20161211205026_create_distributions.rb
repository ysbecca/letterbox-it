class CreateDistributions < ActiveRecord::Migration[5.0]
  def change
    create_table :distributions do |t|
      t.date :date
      t.integer :participants
      t.jsonb :routes
      t.text :comments

      t.timestamps
    end
  end
end
