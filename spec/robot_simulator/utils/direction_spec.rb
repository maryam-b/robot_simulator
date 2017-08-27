require 'spec_helper'
describe RobotSimulator::Utils::Direction do
  let(:position_x) { '1' }
  let(:position_y) { '1' }
  let(:orientation) { 'NORTH' }
  let(:direction) { described_class.new(position_x, position_y, orientation) }

  describe '.new' do
    it 'initialize Direction' do
      expect(direction.position_x).to eq position_x.to_i
      expect(direction.position_y).to eq position_y.to_i
      expect(direction.orientation).to eq orientation
    end
  end
end
