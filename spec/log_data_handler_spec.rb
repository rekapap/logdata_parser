require 'log_data_handler'

describe LogDataHandler do
  let(:data) { subject.instance_variable_get(:@data) }
  let(:uri)  { 'about/2' }
  let(:ip) { '222.222.222.222' }
  let(:uri2) { 'uri/2' }
  let(:ip2) { '111.111.111.111' }
  describe '#process_data' do
    it 'updates uri data if uri exsist' do
      subject.instance_variable_set(:@data, uri => { ip => 1 })
      subject.process_data(uri, ip)
      expect(data[uri][ip]).to eq(2)
    end
    it 'adds new uri to data if uri does not exsist' do
      subject.instance_variable_set(:@data, {})
      subject.process_data(uri, ip)
      expect(data[uri][ip]).to eq(1)
    end
    it 'updates uri data if uri exsist and ip doesn\'t exsists' do
      subject.instance_variable_set(:@data, uri => { ip2 => 1 })
      subject.process_data(uri, ip)
      expect(data[uri][ip]).to eq(1)
    end
  end
  describe '#total_visits' do
    it 'returns the total visits per uri' do
      subject.instance_variable_set(:@data, uri => { ip => 2 }, uri2 => { ip => 1 })
      expect(subject.total_visits).to eq([[uri, 2], [uri2, 1]])
    end
  end
  describe '#unique_visits' do
    it 'returns the unique visits per uri' do
      subject.instance_variable_set(:@data, uri => { ip => 2 }, uri2 => { ip => 1 })
      expect(subject.unique_visits).to eq([[uri, 1], [uri2, 1]])
    end
  end
end
