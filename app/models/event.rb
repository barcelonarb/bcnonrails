class Event < ActiveRecord::Base
  include Geocodable
  
  validates_presence_of :date, :title, :location
  
  named_scope :next, :conditions => ['date > ?', DateTime.now - 2.hours], :order => 'date asc'
  
  before_save :geocode_location
end
