class AddMoreInformationToEvents < ActiveRecord::Migration
  def change
    add_column :events, :additional_info, :text
  end
end
