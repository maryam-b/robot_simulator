require 'spec_helper'
describe RobotSimulator::Table do
  describe '.new' do
    it 'initialize Table with default value' do
      table = described_class.new
      expect(table.x).to eq(4)
      expect(table.y).to eq(4)
    end
  end

  describe '#position_valid?' do
    let(:table) { described_class.new }
    context 'position is valid' do
      let(:direction) { RobotSimulator::Utils::Direction.new(4, 1, 'NORTH') }
      it 'return true' do
        expect(table.position_valid?(direction)).to be true
      end
    end

    context 'position is invalid' do
      let(:direction) { RobotSimulator::Utils::Direction.new(6, 1, 'NORTH') }
      it 'return false' do
        expect(table.position_valid?(direction)).to be false
      end
    end
  end
end
