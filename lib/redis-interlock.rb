require 'redis'
require 'redis/interlock'

class Redis
  include Redis::Interlock::Extension
end
