# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def javascript(code)
    content_for(:javascript) { code }
  end
  
  def location_map(location, width = '900', height = '200')
    unless location.nil? || !location.geocoded?
      map = GMap.new 'map'
      map.control_init
      map.center_zoom_on_points_init location.lat_lng_pair
      map.overlay_init GMarker.new(location.lat_lng_pair)
      
      content_for(:javascript) { map.to_html }
      
      map.div(:width => width, :height => height) 
    end
  end
end
