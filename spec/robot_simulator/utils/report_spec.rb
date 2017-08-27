require 'spec_helper'
describe RobotSimulator::Utils::Report do
  let(:robot) { RobotSimulator::Robot.new }
  let(:table) { RobotSimulator::Table.new }
  let(:report) { described_class.new(robot, table) }

  describe '#exec!' do
    context 'robot is not placed' do
      let(:message) { "Your robot is not placed yet!\n" }
      it 'should return correct message' do
        expect { report.exec! }.to output(message).to_stdout
      end
    end

    context 'robot is placed' do
      let(:current_position) { "0,0,NORTH\n" }
      let(:message) { "Current position is: #{current_position}" }
      let(:direction) { RobotSimulator::Utils::Direction.new(0, 0, 'NORTH') }
      before { robot.current_position = direction }
      it 'should return current position of robot' do
        expect { report.exec! }.to output(message).to_stdout
      end
    end
  end
end
