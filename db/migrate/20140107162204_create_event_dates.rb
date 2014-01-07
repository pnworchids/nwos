class CreateEventDates < ActiveRecord::Migration
  def change
    create_table :event_dates do |t|
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :event_id

      t.timestamps
    end
  end
end
