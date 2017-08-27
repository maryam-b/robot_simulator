module RobotSimulator
  module Utils
    class Place < Command
      def exec!
        raise NotValidDirection unless @table.position_valid?(@direction)
        @robot.current_position = @direction
      end
    end
  end
end
