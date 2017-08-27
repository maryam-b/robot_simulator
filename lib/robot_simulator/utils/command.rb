module RobotSimulator
  module Utils
    class Command
      def initialize(robot, table, direction = nil)
        @robot = robot
        @table = table
        @direction = direction
      end
    end
  end
end
