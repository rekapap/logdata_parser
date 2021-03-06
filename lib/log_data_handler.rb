# frozen_string_literal: true

# Handles logdata
# Stores it and returns data depending on the query
class LogDataHandler
  def initialize
    @data = {}
    @comparison_proc = proc { |a, b|
      a[1] == b[1] ? a[0] <=> b[0] : b[1] <=> a[1]
    }
  end

  # add an uri ip pair to data
  #
  # parameters: uri,ip
  def process_data(uri, ip)
    @data.key?(uri) ? update_uri(uri, ip) : add_uri(uri, ip)
  end

  # returns the total visit list
  #
  # sorted by most visited
  #
  # sorted by alphabetical order for the same count
  def total_visits
    @data.map do |uri, ips|
      [uri, ips.values.reduce(:+)]
    end.sort(&@comparison_proc)
  end

  # returns the unique visit list
  #
  # sorted by most visited
  #
  # sorted by alphabetical order for the same count
  def unique_visits
    @data.map { |uri, ips| [uri, ips.size] }.sort(&@comparison_proc)
  end

  private

  def update_uri(uri, ip)
    @data[uri].key?(ip) ? @data[uri][ip] += 1 : @data[uri][ip] = 1
  end

  def add_uri(uri, ip)
    @data[uri] = { ip => 1 }
  end
end
