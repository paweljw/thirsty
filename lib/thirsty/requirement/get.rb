# frozen_string_literal: true

module Thirsty
  module Requirement
    class Get < Callable
      def call
        File.read(File.expand_path('~/.thirsty/requirement.txt')).to_f || '0.0'
      end
    end
  end
end
