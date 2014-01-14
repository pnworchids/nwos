class Event < ActiveRecord::Base
  has_many :event_dates
  accepts_nested_attributes_for :event_dates, allow_destroy: true

  validates :name, :street_address, :city, :state_province, presence: true
  validates :name, length: { maximum: 50 }
end
