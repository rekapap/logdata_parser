require_relative 'log_data_handler'

# Responsible parsing a log file
class Parser
  def self.parse(filename:, data_handler: LogDataHandler)
    data = data_handler.new
    File.open(filename, 'r') do |file|
      file.each do |line|
        uri, ip = line.split
      end
    end
  end
end
