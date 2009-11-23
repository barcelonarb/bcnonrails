class MiscController < ApplicationController
  
  def home
    @event = Event.next.first
  end

end