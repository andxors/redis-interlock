require 'redlock'
require 'redis/interlock/version'
require 'redis/interlock/error'
require 'redis/interlock/extension'

class Redis
  class Interlock
    # @attr_reader redis   [Redis]   redis instance.
    # @attr_reader name    [String]  lock name.
    # @attr_reader seconds [Integer] lock duration in seconds.
    attr_reader :redis, :name, :seconds

    # @param redis   [Redis]   redis instance.
    # @param name    [String]  lock name.
    # @param seconds [Integer] lock duration in seconds.
    def initialize(redis:, name:, seconds:)
      @redis   = redis
      @name    = name
      @seconds = seconds
    end

    def lock!(&block)
      redlock.lock!(key, milliseconds, &block)
    rescue Redlock::LockError => e
      raise Redis::Interlock::Error.new(self, e.inspect)
    end

    private

    def redlock
      @redlock ||= Redlock::Client.new([redis])
    end

    def key
      @key ||= "#{self.class.name}[#{name}]"
    end

    def milliseconds
      @milliseconds ||= seconds * 1000
    end
  end
end
