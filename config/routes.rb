# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html


resources :time_entries, :controller => 'timelog', :except => :destroy do
    collection do
      get 'report'
      get 'bulk_edit'
      post 'bulk_update_accept_report'
    end
  end