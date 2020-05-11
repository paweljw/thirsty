# frozen_string_literal: true

require 'date'

module Thirsty
  module Today
    class Get < Callable
      def call
        return 0.0 unless file_exists?

        today
      end

      private

      def file_path
        @file_path ||= File.expand_path("~/.thirsty/#{Date.today}.txt")
      end

      def file_exists?
        File.exist?(file_path)
      end

      def today
        File.read(file_path).to_f
      end
    end
  end
end
