require 'spec_helper'
describe RobotSimulator::Utils::Direction do
  let(:position_x) { 1 }
  let(:position_y) { 1 }
  let(:orientation) { 'NORTH' }
  let(:direction) { described_class.new(position_x, position_y, orientation) }

  describe '.new' do
    it 'initialize Direction' do
      expect(direction.position_x).to eq position_x
      expect(direction.position_y).to eq position_y
      expect(direction.orientation).to eq orientation
    end
  end

  describe '#move_to' do
    context 'north' do
      let(:new_y) { 2 }
      it 'should 1 unit move to north' do
        move_north = direction.move_to
        expect(move_north.position_x).to eq position_x
        expect(move_north.position_y).to eq new_y
        expect(move_north.orientation).to eq orientation
      end
    end

    context 'east' do
      let(:orientation) { 'EAST' }
      let(:new_x) { 2 }
      it 'should 1 unit move to east' do
        move_north = direction.move_to
        expect(move_north.position_x).to eq new_x
        expect(move_north.position_y).to eq position_y
        expect(move_north.orientation).to eq orientation
      end
    end

    context 'south' do
      let(:orientation) { 'SOUTH' }
      let(:new_y) { 0 }
      it 'should 1 unit move to south' do
        move_north = direction.move_to
        expect(move_north.position_x).to eq position_x
        expect(move_north.position_y).to eq new_y
        expect(move_north.orientation).to eq orientation
      end
    end

    context 'west' do
      let(:orientation) { 'WEST' }
      let(:new_x) { 0 }
      it 'should 1 unit move to west' do
        move_north = direction.move_to
        expect(move_north.position_x).to eq new_x
        expect(move_north.position_y).to eq position_y
        expect(move_north.orientation).to eq orientation
      end
    end

    context 'not available method' do
      let(:orientation) { 'NOWHERE' }
      it 'should raise error' do
        expect { direction.move_to }.to raise_error(RobotSimulator::NotValidMethodError)
      end
    end
  end
end
