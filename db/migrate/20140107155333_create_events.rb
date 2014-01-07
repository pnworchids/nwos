class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :venue
      t.string :street_address
      t.string :city
      t.string :state_province
      t.string :zip_code
      t.datetime :publish_at

      t.timestamps
    end
  end
end
