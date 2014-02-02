class Event < ActiveRecord::Base
  has_many :event_dates
  accepts_nested_attributes_for :event_dates, allow_destroy: true

  validates :name, :street_address, :city, :state_province, presence: true
  validates :name, length: { maximum: 50 }

  def self.order_by_date
    joins(:event_dates).includes(:event_dates).order("event_dates.starts_at")
    # instead of selecting recent dates, just select them all reguardless and run a regular rake task to delete old ones.
    # joins(:event_dates).includes(:event_dates).where("event_dates.ends_at > ?", DateTime.now.utc - 2.weeks).references(:event_dates)
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

end
