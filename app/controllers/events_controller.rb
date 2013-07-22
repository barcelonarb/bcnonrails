class EventsController < ApplicationController
  before_filter :require_user, :except => [:index, :show]
  
  def index
    @events = Event.next.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])

    if @event.save
      flash[:notice] = 'Event was successfully created.'
      redirect_to(@event)
    else
      render :action => "new"
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(params[:event])
      flash[:notice] = 'Event was successfully updated.'
      redirect_to(@event)
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  
    redirect_to(events_url)
  end
end
