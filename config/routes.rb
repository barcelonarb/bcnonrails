ActionController::Routing::Routes.draw do |map|
  
  root :to => 'misc#home' # optional, this just sets the root route
  
  map.new_user_session  '/login', :controller => 'user_sessions', :action => 'new'
  map.logout '/logout', :controller => 'user_sessions', :action => 'destroy'
  
  map.profile '/profile/:id', :controller => 'users', :action => 'profile'
  
  map.resource :account, :controller => "users"
  map.resource :user_session
  map.resources :password_resets
  map.resources :events
  map.resources :companies
  map.resources :jobs

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
