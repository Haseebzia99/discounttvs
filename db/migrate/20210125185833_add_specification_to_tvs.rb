class AddSpecificationToTvs < ActiveRecord::Migration[6.0]
  def change
    add_column :tvs, :specification, :text
  end
end
