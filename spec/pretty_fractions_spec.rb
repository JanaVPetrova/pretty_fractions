# frozen_string_literal: true

RSpec.describe PrettyFractions do
  describe '#pretty_print' do
    subject(:pretty_print) { described_class.pretty_print(value) }

    shared_examples 'pretty fraction' do |rational, symbol|
      let(:value) { 1 + rational }

      it { expect(pretty_print).to eq "1#{symbol}" }
    end

    described_class::FRACTIONS.each do |rational, symbol|
      it_behaves_like 'pretty fraction', rational, symbol
    end

    context 'when no wholes given' do
      let(:value) { 1/8r }

      it { expect(pretty_print).to eq '⅛' }
    end
  end
end
