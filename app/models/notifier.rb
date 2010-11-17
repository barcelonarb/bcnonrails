class Notifier < ActionMailer::Base  
  default_url_options[:host] = APP_CONFIG[:site_url] 
  
  def password_reset_instructions(user)  
    subject       "Password Reset Instructions"
    from          APP_CONFIG[:site_email]  
    recipients    user.email  
    sent_on       Time.now  
    body          :edit_password_reset_url => edit_password_reset_url(user.perishable_token)  
  end
  
  def event_to_bcnonrails(event)
    subject       "New event: #{event.title}"
    from          APP_CONFIG[:site_email]  
    recipients    "barcelonaonrails@googlegroups.com"  
    sent_on       Time.now  
    body          :event_url => event_url(event),
                  :event => event
  end  
end