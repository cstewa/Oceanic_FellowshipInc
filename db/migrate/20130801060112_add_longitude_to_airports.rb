class AddLongitudeToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :longitude, :float
  end
end
