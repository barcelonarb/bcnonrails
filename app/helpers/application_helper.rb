module ApplicationHelper
  def page_title(yield_title)
    string = ''
    string = "#{yield_title} - " if yield_title.present?
    string << 'Barcelona on Rails'
  end
end
