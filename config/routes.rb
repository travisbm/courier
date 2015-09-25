Rails.application.routes.draw do

  match "/*all" => "application#cors_options", via: :options

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
