require 'spec_helper'
describe RobotSimulator::Robot do
  let(:robot) { described_class.new }
  describe '.new' do
    it 'initialize with nil current_positon' do
      expect(robot.current_position).to eq nil
    end
  end

  describe '#not_placed?' do
    subject { robot.not_placed? }

    context 'robot is placed' do
      let(:direction) { RobotSimulator::Utils::Direction.new(0, 0, 'NORTH') }
      before { robot.current_position = direction }
      it { is_expected.to be_falsey }
    end

    context 'robot is not placed' do
      it { is_expected.to be_truthy }
    end
  end

  describe '#report_formatted_position' do
    context 'robot is placed' do
      let(:direction) { RobotSimulator::Utils::Direction.new(0, 0, 'NORTH') }
      before { robot.current_position = direction }
      it 'should return current position in printed format' do
        expect(robot.report_formatted_position).to eq '0,0,NORTH'
      end
    end

    context 'robot is not placed' do
      it 'should raise error' do
        expect { robot.report_formatted_position }.to raise_error(RobotSimulator::NotPlacedError)
      end
    end
  end
end
