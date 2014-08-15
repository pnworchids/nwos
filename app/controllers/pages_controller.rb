class PagesController < ApplicationController
  def home
    @featured = FeaturedBlock.find(:all, :order => "weight asc", :limit => 5)
    @generic_event = Event.upcoming.first
  end

  def contact
    @message = ContactMessage.new
  end
end
