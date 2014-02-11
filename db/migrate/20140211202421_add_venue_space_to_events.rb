class AddVenueSpaceToEvents < ActiveRecord::Migration
  def change
    add_column :events, :venue_space, :string
  end
end
