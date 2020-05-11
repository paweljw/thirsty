# frozen_string_literal: true

require 'fileutils'

module Thirsty
  module Requirement
    class Update < Callable
      def initialize(requirement)
        @requirement = requirement
      end

      def call
        validate_input
        ensure_directory
        write_requirement
      end

      private

      attr_reader :requirement

      def validate_input
        if requirement !~ /^\s*[+-]?((\d+_?)*\d+(\.(\d+_?)*\d+)?|\.(\d+_?)*\d+)(\s*|([eE][+-]?(\d+_?)*\d+)\s*)$/
          raise ArgumentError, "invalid value for Float(): #{requirement.inspect}"
        end
      end

      def ensure_directory
        FileUtils.mkdir_p(File.expand_path('~/.thirsty'))
      end

      def write_requirement
        File.open(File.expand_path('~/.thirsty/requirement.txt'), 'w+') { |f| f << requirement.to_f }
      end
    end
  end
end
