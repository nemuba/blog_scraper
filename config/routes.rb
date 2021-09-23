# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  get 'tags/index'
  mount Sidekiq::Web => '/sidekiq'

  root 'welcome#index'

  get 'blog/:site_name/posts', to: 'posts#index', as: 'posts'
  get 'blog/:site_name/tags', to: 'tags#index', as: 'tags'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
