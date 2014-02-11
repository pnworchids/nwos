class EventsController < ApplicationController

  def index
    @events = Event.order_by_date
  end

  def show
    @event = Event.find(params[:id])
  end

  def by_category
    @category = Category.find(params[:id])
    @events = @category.events.order_by_date
    render 'index'
  end

end