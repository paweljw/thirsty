# frozen_string_literal: true

module Thirsty
  class Callable
    def self.call(*args)
      new(*args).call
    end

    # @abstract Subclass is expected to implement #call
    # @!method call
  end
end
