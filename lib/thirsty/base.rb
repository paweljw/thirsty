# frozen_string_literal: true

require_relative 'version'
require_relative 'callable'
require_relative 'cli'

module Thirsty
  autoload :Requirement, File.expand_path('requirement', __dir__)
  autoload :Today,       File.expand_path('today', __dir__)
end
