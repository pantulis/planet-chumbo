ActionController::Routing::Routes.draw do |map|
  

  # Gestion de logins y tal
  map.resource :session
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'


  map.namespace :admin do |admin|
    admin.resources :feeds
  end

  map.resources :front_pages
  map.resources :feed_posts
  map.resources :feeds

  map.root :controller => "front_pages", :action => 'index'

end
