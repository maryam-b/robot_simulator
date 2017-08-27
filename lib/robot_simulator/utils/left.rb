module RobotSimulator
  module Utils
    class Left < Command
      ORIENTATIONS = %w(NORTH EAST SOUTH WEST).freeze

      def exec!
        raise NotPlacedError if @robot.not_placed?
        @robot.current_position = Utils::Direction.new(@robot.current_position.position_x,
                                                       @robot.current_position.position_y,
                                                       left_orientation)
      end

      private

      def left_orientation
        ORIENTATIONS[(ORIENTATIONS.index(@robot.current_position.orientation) - 1) % 4]
      end
    end
  end
end
