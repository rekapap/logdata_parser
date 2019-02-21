require 'log_data_formatter'

describe LogDataFormatter do
  let(:described_class) { LogDataFormatter }
  let(:data) { [['uri', 2],['uri2', 1]] }
  let(:total_visits) { "uri 2 visits.\nuri2 1 visits." }
  describe '.format_total' do
    it 'returns a string with the date formatted like this: {uri} {count} visits' do
      expect(described_class.format_total(data)).to eq(total_visits)
    end
  end
end
