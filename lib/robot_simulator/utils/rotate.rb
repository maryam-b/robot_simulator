module RobotSimulator
  module Utils
    class Rotate < Command
      ORIENTATIONS = %w(NORTH EAST SOUTH WEST).freeze

      def exec!
        raise NotPlacedError if @robot.not_placed?
        @robot.current_position = Utils::Direction.new(@robot.current_position.position_x,
                                                       @robot.current_position.position_y,
                                                       new_orientation)
      end

      def new_orientation
        raise AbstractMethod
      end
    end
  end
end
