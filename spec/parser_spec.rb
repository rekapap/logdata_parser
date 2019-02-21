require 'parser'

describe Parser do
  let(:described_class) { Parser }
  let(:logdata) { double :logdata }
  let(:logdata_class) { double :logdata_class, new: logdata }
  let(:line) { 'about/2 222.222.222.222' }
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
  end
end
