require 'spec_helper'
describe RobotSimulator::Utils::Move do
  let(:robot) { RobotSimulator::Robot.new }
  let(:table) { RobotSimulator::Table.new }
  let(:move) { described_class.new(robot, table) }
  describe '.new' do
    it 'initialize Move' do
      expect(move.instance_variable_get(:@robot)).to eq robot
      expect(move.instance_variable_get(:@table)).to eq table
    end
  end

  describe '#exec!' do
    context 'robot is not placed' do
      it 'should raise error' do
        expect { move.exec! }.to raise_error(RobotSimulator::NotPlacedError)
      end
    end

    context 'robot is placed' do
      before do
        robot.current_position = direction
      end

      context 'direction is valid' do
        let(:direction) { RobotSimulator::Utils::Direction.new(1, 1, 'NORTH') }
        let(:new_direction) { RobotSimulator::Utils::Direction.new(1, 2, 'NORTH') }
        it 'should set new position as current position of robot' do
          move.exec!
          expect(robot.current_position.position_x).to eq new_direction.position_x
          expect(robot.current_position.position_y).to eq new_direction.position_y
          expect(robot.current_position.orientation).to eq new_direction.orientation
        end
      end

      context 'direction is not valid' do
        let(:direction) { RobotSimulator::Utils::Direction.new(0, 0, 'WEST') }
        it 'should raise error' do
          expect { move.exec! }.to raise_error(RobotSimulator::NotValidDirection)
        end
      end
    end
  end
end
