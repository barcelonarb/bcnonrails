# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def javascript(code)
    content_for(:javascript) { code }
  end
  
  def location_map(location, id = 'map', width = '960', height = '150')
    unless location.nil? || !location.geocoded?
      map = GMap.new id
      map.control_init
      map.center_zoom_on_points_init location.lat_lng_pair
      map.overlay_init GMarker.new(location.lat_lng_pair)
      
      content_for(:javascript) { map.to_html }
      
      map.div(:width => width, :height => height) 
    end
  end
  
  def selected?(controller, action = nil)
    if action.nil?
      "selected" if params[:controller] == controller
    else
      "selected" if params[:controller] == controller && params[:action] == action
    end
  end
end
