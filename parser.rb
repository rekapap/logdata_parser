# frozen_string_literal: true

require_relative 'lib/parser'
require_relative 'lib/log_data_formatter'

data = Parser.parse(filename: ARGV.first)
puts 'Total'
puts LogDataFormatter.format_total(data.total_visits)
puts "\nUnique"
puts LogDataFormatter.format_unique(data.unique_visits)
