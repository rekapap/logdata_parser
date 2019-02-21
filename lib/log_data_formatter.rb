# Formatter
class LogDataFormatter
  def self.format_total(visits)
    visits.map { |uri, count| "#{uri} #{count} visits." }.join("\n")
  end
  def self.format_unique(visits)
    visits.map { |uri, count| "#{uri} #{count} unique visitors." }.join("\n")
  end
end
