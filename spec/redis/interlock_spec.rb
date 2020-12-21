describe Redis::Interlock do
  describe '.version' do
    it 'has a version number' do
      expect(described_class::VERSION).to eq('0.0.2')
    end
  end

  describe '#lock!' do
    let(:mutex) { described_class.new(redis: redis, name: 'lock_name', seconds: 10) }
    let(:redis) { Redis.new }

    context 'when lock is available' do
      it 'executes block' do
        expect(mutex.lock! { 1 + 2 }).to eq(3)
      end
    end

    context 'when lock is not available' do
      before do
        redis.set("#{described_class}[lock_name]", 'value', ex: 10)
      end

      after do
        redis.del("#{described_class}[lock_name]")
      end

      it 'raises an exception' do
        expect { mutex.lock! { 1 + 2 } }.to raise_error(described_class::Error)
      end
    end
  end
end
