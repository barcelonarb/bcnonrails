class MiscController < ApplicationController
  
  def home
    @event = Event.next.first
    @users = User.random(36)
    @companies = Company.random(10)
    @jobs = Job.find(:all, :order => 'created_at', :limit => 10)
    @events = Event.next.all(10)
  end

end