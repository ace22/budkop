BudKop::Application.routes.draw do |map|
  resources :contacts, :actions => [:create, :index]
  resource :worker
  resource :worker_session
  resource :account, :controller => "workers"
#  resource :home, :controller => 'home'
  resource :services
  resource :technology, :controller => 'technology'
  resource :people
  resource :contact_us
  root :to => 'people#show'
end
