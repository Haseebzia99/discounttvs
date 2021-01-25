class AddBrandToTvs < ActiveRecord::Migration[6.0]
  def change
    add_column :tvs, :brand, :string
  end
end
