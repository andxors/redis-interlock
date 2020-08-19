class Redis
  class Interlock
    module Extension
      # @param name    [String]  lock name.
      # @param seconds [Integer] lock duration in seconds.
      def lock!(name:, seconds:, &block)
        Redis::Interlock.new(redis: self, name: name, seconds: seconds).lock!(&block)
      end
    end
  end
end
