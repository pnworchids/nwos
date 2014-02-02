class AddGeocodeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :geocode_lat, :string
    add_column :events, :geocode_lng, :string
  end
end
