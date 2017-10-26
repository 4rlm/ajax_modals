require 'bundler'
Bundler.require

configure :development do
  set :database, {
    adapter: 'postgresql',
    encoding: 'unicode',
    database: 'ajax_modals',
    pool: 5
  }
end

configure :production do
  set :database, {
    adapter: 'postgresql',
    encoding: 'unicode',
    database: 'ajax_modals',
    pool: 5
  }
end

require_all 'app'

