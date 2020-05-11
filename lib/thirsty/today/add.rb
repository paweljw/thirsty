# frozen_string_literal: true

require 'date'

module Thirsty
  module Today
    class Add < Callable
      def initialize(amount)
        @amount = amount
      end

      def call
        validate_amount
        update_amount
      end

      private

      attr_reader :amount

      def validate_amount
        if amount !~ /^\s*[+-]?((\d+_?)*\d+(\.(\d+_?)*\d+)?|\.(\d+_?)*\d+)(\s*|([eE][+-]?(\d+_?)*\d+)\s*)$/
          raise ArgumentError, "invalid value for Float(): #{requirement.inspect}"
        end
      end

      def normalized_amount
        amount_f = amount.to_f
        amount_f < 3 ? amount_f : amount_f / 1000
      end

      def current
        @current ||= Get.call
      end

      def update_amount
        full_amount = current + normalized_amount
        File.open(File.expand_path("~/.thirsty/#{Date.today}.txt"), 'w+') { |f| f << full_amount }
      end
    end
  end
end
