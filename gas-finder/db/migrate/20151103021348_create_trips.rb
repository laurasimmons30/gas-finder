class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :starting_gas
      t.integer :ending_gas
      t.integer :total_miles

      t.timestamps
    end
  end
end
