Rails.application.routes.draw do
  match '*path', :controller => 'application', :action => 'handle_options_request', :constraints => {:method => 'OPTIONS'}

  resources :users do
    resources :jobs, :addresses
  end

  resources :messengers do
    resources :jobs
  end

  resources :jobs do
    resources :addresses
  end



  root 'jobs#index'

end
