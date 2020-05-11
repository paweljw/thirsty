# frozen_string_literal: true

require 'thor'

module Thirsty
  class Cli < Thor
    desc 'update_requirement REQUIREMENT', 'sets your required intake to REQUIREMENT liters'
    def update_requirement(requirement)
      Requirement::Update.call(requirement)
    rescue ArgumentError
      puts "The value #{requirement} does not look like a valid number."
      exit 1
    end

    desc 'requirement', 'get your current required intake'
    def requirement
      puts "#{Requirement::Get.call}L"
    rescue Errno::ENOENT
      puts 'Please set your requirement first.'
      exit 1
    end

    desc 'today', 'get your today intake'
    def today
      requirement = Requirement::Get.call
      today = Today::Get.call
      percentage = (today / requirement * 100).to_i
      puts "#{today} / #{requirement} (#{percentage}%)"
    rescue Errno::ENOENT
      puts 'Please set your requirement first.'
      exit 1
    end

    desc 'add AMOUNT', 'add AMOUNT to your current intake'
    def add(amount)
      Today::Add.call(amount)
    rescue ArgumentError
      puts "The value #{amount} does not look like a valid number."
      exit 1
    end
  end
end
