require 'redis'
require 'sinatra' # Uses ENV['PORT'].
require 'sinatra/stoplight_admin'

redis = Redis.new # Uses ENV['REDIS_URL'].
data_store = Stoplight::DataStore::Redis.new redis
set :data_store, data_store

get '/health-check' do
  redis.ping
end
