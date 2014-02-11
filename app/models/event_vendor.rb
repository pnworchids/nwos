class EventVendor < ActiveRecord::Base
  belongs_to :event
  belongs_to :vendor

  validates :event_id, :vendor_id, presence: true
end
