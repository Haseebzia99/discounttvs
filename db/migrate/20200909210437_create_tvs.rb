class CreateTvs < ActiveRecord::Migration[6.0]
  def change
    create_table :tvs do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :year
      t.integer :size

      t.timestamps
    end
  end
end
