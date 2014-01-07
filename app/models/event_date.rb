class EventDate < ActiveRecord::Base
  belongs_to :event
  validates :starts_at, :ends_at, :event_id, presence: true
end
