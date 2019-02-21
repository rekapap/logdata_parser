# Handles logdata
# Stores it and returns data depending on the query
class LogDataHandler
  def initialize
    @data = {}
  end

  def process_data(uri, ip)
    @data.key?(uri) ? update_uri(uri, ip) : add_uri(uri, ip)
  end

  private

  def update_uri(uri, ip)
    @data[uri].key?(ip) ? @data[uri][ip] += 1 : @data[uri][ip] = 1
  end

  def add_uri(uri, ip)
    @data[uri] = { ip => 1 }
  end
end