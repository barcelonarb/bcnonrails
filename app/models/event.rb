class Event < ActiveRecord::Base
  validates_presence_of :date, :title, :location
  
  before_save     :geocode_location
  
  def lat_lng_pair
    [self.lat, self.lng]
  end

  def geocoded?
    self.lat && self.lng
  end
  
  protected
    def geocode_location
      g = GeoKit::Geocoders::MultiGeocoder.geocode(self.location)
      if g.success
        self.lat = g.lat
        self.lng = g.lng
      end
    end
end
