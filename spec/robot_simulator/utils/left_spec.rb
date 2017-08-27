require 'spec_helper'
describe RobotSimulator::Utils::Left do
  let(:robot) { RobotSimulator::Robot.new }
  let(:table) { RobotSimulator::Table.new }
  let(:left) { described_class.new(robot, table) }
  describe '#exec!' do
    context 'robot is not placed' do
      it 'should raise error' do
        expect { left.exec! }.to raise_error(RobotSimulator::NotPlacedError)
      end
    end

    context 'robot is placed' do
      before do
        robot.current_position = direction
      end
      context 'current orientation is NORTH' do
        let(:direction) { RobotSimulator::Utils::Direction.new(1, 1, 'NORTH') }
        it 'should rotate robot orienation -90 degree' do
          left.exec!
          expect(robot.current_position.orientation).to eq 'WEST'
        end
      end

      context 'current orientation is EAST' do
        let(:direction) { RobotSimulator::Utils::Direction.new(1, 1, 'EAST') }
        it 'should rotate robot orienation -90 degree' do
          left.exec!
          expect(robot.current_position.orientation).to eq 'NORTH'
        end
      end
    end
  end
end
