class EventsController < ApplicationController

  def index
    @events = Event.order_by_date
  end

  def show
    @event = Event.find(params[:id])
  end

end