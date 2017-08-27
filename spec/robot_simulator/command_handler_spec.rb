require 'spec_helper'
describe RobotSimulator::CommandsHandler do
  let(:table) { RobotSimulator::Table.new }
  let(:robot) { RobotSimulator::Robot.new }
  let(:command) { described_class.new(table, robot) }
  describe '.new' do
    it 'initialize with table and robot' do
      expect(command.instance_variable_get(:@robot)).to eq robot
      expect(command.instance_variable_get(:@table)).to eq table
    end
  end

  describe '#parser' do
    context 'valid input' do
      let(:direction) { RobotSimulator::Utils::Direction.new(0, 0, 'NORTH') }

      context 'PLACE command' do
        let(:input) { 'PLACE 0,0,NORTH' }
        it 'should call the Place class' do
          expect(RobotSimulator::Utils::Direction).to receive(:new).with('0', '0', 'NORTH').and_return(direction)
          allow_any_instance_of(RobotSimulator::Utils::Place).to receive(:new).with(robot, table, direction)
          command.parser(input)
        end
      end

      context 'REPORT command' do
        let(:input) { "REPORT\n" }
        it 'should call the Right class' do
          allow_any_instance_of(RobotSimulator::Utils::Report).to receive(:new).with(robot, table)
          command.parser(input)
        end
      end

      context 'LEFT command' do
        let(:input) { "LEFT\n" }
        before do
          robot.current_position = direction
        end
        it 'should call the Left class' do
          allow_any_instance_of(RobotSimulator::Utils::Left).to receive(:new).with(robot, table)
          command.parser(input)
        end
      end

      context 'RIGHT command' do
        let(:input) { "RIGHT\n" }
        before do
          robot.current_position = direction
        end
        it 'should call the Right class' do
          allow_any_instance_of(RobotSimulator::Utils::Right).to receive(:new).with(robot, table)
          command.parser(input)
        end
      end

      context 'MOVE command' do
        let(:input) { "MOVE\n" }
        before do
          robot.current_position = direction
        end
        it 'should call the Move class' do
          allow_any_instance_of(RobotSimulator::Utils::Move).to receive(:new).with(robot, table)
          command.parser(input)
        end
      end
    end

    context 'invalid input' do
      let(:invalid_input) { 'test' }
      it 'should raise error' do
        expect { command.parser(invalid_input) }.to raise_error(RobotSimulator::NotValidCommandError)
      end
    end
  end
end
