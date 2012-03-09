# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def javascript(code)
    content_for(:javascript) { code }
  end
  
  def location_map(location, width = '960', height = '150', id = 'map')
    unless location.nil? || !location.geocoded?
      map = GMap.new id
      map.control_init
      map.center_zoom_init location.lat_lng_pair, 15
      map.overlay_init GMarker.new(location.lat_lng_pair)
      
      content_for(:javascript) { map }
      map.div(:width => width, :height => height).html_safe
    end
  end
  
  def selected?(controller, action = nil)
    if action.nil?
      "selected" if params[:controller] == controller
    else
      "selected" if params[:controller] == controller && params[:action] == action
    end
  end

  # Format text for display.                                                                    
  def format(text)
    sanitize(markdown(text))
  end

  # Process text with Markdown.                                                                 
  def markdown(text)
    BlueCloth::new(text).to_html.html_safe
  end
end
