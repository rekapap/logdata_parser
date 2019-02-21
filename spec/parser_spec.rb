require 'parser'

describe Parser do
  let(:described_class) { Parser }
  let(:logdata) { double :logdata }
  let(:logdata_class) { double :logdata_class, new: logdata }
  let(:file) { double :file }
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
  end
end
