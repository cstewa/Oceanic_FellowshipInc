class AddLatitudeToAirports < ActiveRecord::Migration
  def change
    add_column :airports, :latitude, :float
  end
end
