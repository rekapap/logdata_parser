# Handles logdata
# Stores it and returns data depending on the query
class LogDataHandler
  def initialize
    @data = {}
  end

  def process_data(uri, ip)
    update_uri(uri, ip) if @data.key?(uri)
  end

  private

  def update_uri(uri, ip)
    @data[uri][ip] += 1
  end
end