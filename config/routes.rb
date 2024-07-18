Rails.application.routes.draw do
  root 'welcome#index'

  get '/results', to: 'welcome#index'
  post '/results', to: 'welcome#results'

  get "up" => "rails/health#show", as: :rails_health_check
end