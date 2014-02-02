class AddAdmissionAndDescriptionToEvents < ActiveRecord::Migration
  def change
    add_column :events, :admission_info, :text
    add_column :events, :description, :text
  end
end
