describe Redis do
  describe '#lock!' do
    let(:redis) { described_class.new }
    let(:lock!) { redis.lock!(name: 'lock_name', seconds: 10) { 1 + 2 } }

    context 'when lock is available' do
      it 'executes block' do
        expect(lock!).to eq(3)
      end
    end

    context 'when lock is not available' do
      before do
        redis.set("#{described_class::Interlock}[lock_name]", 'value', ex: 10)
      end

      after do
        redis.del("#{described_class::Interlock}[lock_name]")
      end

      it 'raises an exception' do
        expect { lock! }.to raise_error(described_class::Interlock::Error)
      end
    end
  end
end
