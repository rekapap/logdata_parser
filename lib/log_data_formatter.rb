# frozen_string_literal: true

# Formatter
class LogDataFormatter
  # Returns a string in the total visit format from an array of uris and counts
  def self.format_total(visits)
    visits.map { |uri, count| "#{uri} #{count} visits." }.join("\n")
  end

  # Returns a string in the unique visit format from an array of uri and counts
  def self.format_unique(visits)
    visits.map { |uri, count| "#{uri} #{count} unique visitors." }.join("\n")
  end
end
