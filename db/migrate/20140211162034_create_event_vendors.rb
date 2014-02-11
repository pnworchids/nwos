class CreateEventVendors < ActiveRecord::Migration
  def change
    create_table :event_vendors do |t|
      t.integer :event_id
      t.integer :vendor_id
      t.text :additional_info

      t.timestamps
    end
  end
end
