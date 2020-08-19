describe Redis::Interlock::Error do
  describe '#interlock' do
    let(:error)     { described_class.new(interlock, 'error_message') }
    let(:interlock) { Redis::Interlock.new(redis: redis, name: 'lock_name', seconds: 10) }
    let(:redis)     { Redis.new }

    it 'returns the interlock' do
      expect(error.interlock).to eq(interlock)
    end
  end

  describe '#message' do
    let(:error) { described_class.new(nil, 'error_message') }

    it 'returns the message' do
      expect(error.message).to eq('error_message')
    end
  end
end
