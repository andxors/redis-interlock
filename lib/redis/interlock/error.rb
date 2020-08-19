class Redis
  class Interlock
    class Error < RuntimeError
      # @attr_reader interlock [Redis::Interlock] the lock that raised the exception.
      attr_reader :interlock

      def initialize(interlock, message)
        @interlock = interlock

        super(message)
      end
    end
  end
end
