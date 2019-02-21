require_relative 'log_data_handler'

# Responsible parsing a log file
class Parser
  def self.parse(filename:, data_handler: LogDataHandler)
    data = data_handler.new
  end
end