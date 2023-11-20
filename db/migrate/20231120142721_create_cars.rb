class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :category
      t.string :model
      t.string :brand
      t.string :location
      t.string :transmission
      t.float :day_rate
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
