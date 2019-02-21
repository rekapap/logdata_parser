require 'parser'

describe Parser do
  let(:described_class) { Parser }
  let(:logdata) { double :logdata, process_data: '' }
  let(:logdata_class) { double :logdata_class, new: logdata }
  let(:line) { 'about/2 222.222.222.222' }
  let(:uri)  { 'about/2' }
  let(:ip) { '222.222.222.222' }
  let(:file) { double :file, each: line }
  let(:filename) { 'filename' }
  describe '.parse' do
    it 'creates a new logdata object' do
      allow(File).to receive(:open).with(filename, 'r').and_yield(file)
      expect(logdata_class).to receive(:new)
      described_class.parse(filename: filename, data_handler: logdata_class)
    end
    it 'opens the file' do
      expect(File).to receive(:open).with(filename, 'r').and_yield(file)
      described_class.parse(filename: filename, data_handler: logdata_class)
    end
    it 'it iterates throught the file' do
      allow(File).to receive(:open).with(filename, 'r').and_yield(file)
      expect(file).to receive(:each)
      described_class.parse(filename: filename, data_handler: logdata_class)
    end
    it 'it split the lines to uri and ip' do
      allow(File).to receive(:open).with(filename, 'r').and_yield(file)
      allow(file).to receive(:each).and_yield(line)
      expect(line).to receive(:split)
      described_class.parse(filename: filename, data_handler: logdata_class)
    end
    it 'calls process data on logdata with the line' do
      allow(File).to receive(:open).with(filename, 'r').and_yield(file)
      allow(file).to receive(:each).and_yield(line)
      expect(logdata).to receive(:process_data).with(uri, ip)
      described_class.parse(filename: filename, data_handler: logdata_class)
    end
    it 'returns the data object' do
      allow(File).to receive(:open).with(filename, 'r').and_yield(file)
      allow(file).to receive(:each).and_yield(line)
      expect(described_class.parse(filename: filename, data_handler: logdata_class)).to eq(logdata)
    end
  end
end
