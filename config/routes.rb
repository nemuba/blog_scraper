require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  
  root 'welcome#index'

  get 'posts/:tag_id/list', to: 'posts#index', as: 'posts_list'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
