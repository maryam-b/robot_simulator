module RobotSimulator
  module Utils
    class Direction
      attr_reader :position_x, :position_y, :orientation

      def initialize(x, y, orientation)
        @position_x = x.to_i
        @position_y = y.to_i
        @orientation = orientation
      end
    end
  end
end
