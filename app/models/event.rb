class Event < ActiveRecord::Base
  has_many :event_dates, dependent: :destroy
  accepts_nested_attributes_for :event_dates, allow_destroy: true

  has_many :event_categories, dependent: :destroy
  accepts_nested_attributes_for :event_categories, allow_destroy: true
  has_many :categories, :through => :event_categories

  has_many :event_vendors, dependent: :destroy
  accepts_nested_attributes_for :event_vendors, allow_destroy: true
  has_many :vendors, :through => :event_vendors

  validates :name, :street_address, :city, :state_province, presence: true
  validates :name, length: { maximum: 50 }

  def self.published
    where("publish_at <= ?", DateTime.now.utc)
  end

  def self.order_by_date
    published.joins(:event_dates).includes(:event_dates).order("event_dates.starts_at")
    # instead of selecting recent dates, just select them all reguardless and run a regular rake task to delete old ones.
  end

  def ordered_dates
    EventDate.where(event_id: self.id).order(:starts_at)
  end

  def start_datetime
    self.ordered_dates.first.starts_at
  end

  def end_datetime
    self.ordered_dates.last.ends_at
  end

  def is_current?
    self.end_datetime >= (DateTime.now.utc - 1.day)
  end

end
