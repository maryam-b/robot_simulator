module RobotSimulator
  module Utils
    class Place
      def initialize(robot, table, direction)
        @robot = robot
        @table = table
        @direction = direction
      end

      def exec!
        raise NotValidDirection unless @table.position_valid?(@direction)
        @robot.current_position = @direction
      end
    end
  end
end
