DoubledronesCom::Application.routes.draw do |map|
  resources :contacts, :actions => [:create, :index]
  resource :drone
  resource :drone_session
  resource :account, :controller => "drones"
#  resource :home, :controller => 'home'
  resource :services
  resource :technology, :controller => 'technology'
  resource :people
  resource :contact_us
  root :to => 'people#show'
end
