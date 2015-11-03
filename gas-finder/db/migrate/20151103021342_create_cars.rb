class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :vehicle_id
      t.integer :year, null: false
      t.string :make, null: false
      t.string :model, null: false
      t.integer :city_mpg
      t.integer :highway_mgp
      t.integer :avg_mpg
    end
  end
end
