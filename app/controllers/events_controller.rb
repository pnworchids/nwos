class EventsController < ApplicationController

  def index
    @events = Event.order_by_date
    @categories = Category.order(:name)
  end

  def show
    @event = Event.find(params[:id])
  end

  def by_category
    @category = Category.find(params[:id])
    @events = @category.events
    @categories = Category.order(:name)
    render 'index'
  end

end