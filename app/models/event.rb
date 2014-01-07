class Event < ActiveRecord::Base
  has_many :event_dates
  validates :name, :street_address, :city, :state_province, presence: true
end
