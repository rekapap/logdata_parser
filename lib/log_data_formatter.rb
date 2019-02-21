# Formatter
class LogDataFormatter
  def self.format_total(visits)
    visits.map { |uri, count| "#{uri} #{count} visits." }.join("\n")
  end
end
