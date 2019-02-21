require 'log_data_handler'

describe LogDataHandler do
  let(:data) { subject.instance_variable_get(:@data)}
  let(:uri)  { 'about/2' }
  let(:ip) { '222.222.222.222' }
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
  end
end