class CarMpgToFloats < ActiveRecord::Migration
  def change
    change_column :cars, :city_mpg, :float
    change_column :cars, :highway_mgp, :float
    change_column :cars, :avg_mpg, :float
    rename_column :cars, :highway_mgp, :highway_mpg
  end
end
