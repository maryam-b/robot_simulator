require 'spec_helper'
describe RobotSimulator::Utils::Place do
  let(:robot) { RobotSimulator::Robot.new }
  let(:table) { RobotSimulator::Table.new }
  let(:direction) { RobotSimulator::Utils::Direction.new(1, 0, 'NORTH') }
  let(:place) { described_class.new(robot, table, direction) }

  describe '.new' do
    it 'initialize with table and robot and direction' do
      expect(place.instance_variable_get(:@robot)).to eq robot
      expect(place.instance_variable_get(:@table)).to eq table
      expect(place.instance_variable_get(:@direction)).to eq direction
    end
  end

  describe '#exec!' do
    context 'not valid direction' do
      let(:direction) { RobotSimulator::Utils::Direction.new(5, 0, 'NORTH') }
      it 'should raise error' do
        expect { place.exec! }.to raise_error(RobotSimulator::NotValidDirection)
      end
    end

    context 'valid direction' do
      it 'should set current position of robot' do
        place.exec!
        expect(robot.current_position.position_x).to eq direction.position_x
        expect(robot.current_position.position_y).to eq direction.position_y
        expect(robot.current_position.orientation).to eq direction.orientation
      end
    end
  end
end
