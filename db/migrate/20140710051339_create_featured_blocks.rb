class CreateFeaturedBlocks < ActiveRecord::Migration
  def change
    create_table :featured_blocks do |t|
      t.string :title
      t.text :description
      t.string :http_link
      t.string :image
      t.integer :weight

      t.timestamps
    end
  end
end
