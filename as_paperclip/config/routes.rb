ActionController::Routing::Routes.draw do |map|
  map.namespace :admin do |admin|
    admin.resources :people, :active_scaffold => true
  end
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
