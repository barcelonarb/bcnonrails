require "geocodable"
class Event < ActiveRecord::Base
  include Geocodable

  validates_presence_of :date, :title, :location

  scope :next, :conditions => ['date > ?', DateTime.now - 2.hours], :order => 'date asc'

  before_save :geocode_location
  after_create :deliver_event_to_bcnonrails!

  def deliver_event_to_bcnonrails!
    Notifier.event_to_bcnonrails(self).deliver
  end
end

