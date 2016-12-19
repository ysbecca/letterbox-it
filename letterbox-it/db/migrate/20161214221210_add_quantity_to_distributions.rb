class AddQuantityToDistributions < ActiveRecord::Migration[5.0]
  def change
    add_column :distributions, :quantity, :integer
  end
end
