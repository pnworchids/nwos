class AddSocialMediaCopyToEvents < ActiveRecord::Migration
  def change
    add_column :events, :twitter_share, :string
    add_column :events, :facebook_share, :string
  end
end
