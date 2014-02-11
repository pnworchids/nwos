class Vendor < ActiveRecord::Base
  has_many :event_vendors, dependent: :destroy
  has_many :events, :through => :event_vendors

  validates :name, :location, :url, presence: true
end
