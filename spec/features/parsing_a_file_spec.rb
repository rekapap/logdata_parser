require_relative '../../lib/parser'
require_relative '../../lib/log_data_formatter'

feature 'Feature: Returns the visits' do
  scenario 'returns the total visits' do
    total_visits = '/about/2 3 visits.'
    data = Parser.parse(filename: './fixtures/webserver_fixture.log')
    expect(LogDataFormatter.format_total(data.total_visits)).to eq(total_visits)
  end
  scenario 'returns the unique visits' do
    unique_visits = '/about/2 2 unique visitors.'
    data = Parser.parse(filename: './fixtures/webserver_fixture.log')
    expect(LogDataFormatter.format_unique(data.unique_visits)).to eq(unique_visits)
  end
end
