module RobotSimulator
  module Utils
    class Direction
      attr_reader :position_x, :position_y, :orientation

      def initialize(x, y, orientation)
        @position_x = x.to_i
        @position_y = y.to_i
        @orientation = orientation
      end

      def move_to(current_orientation)
        send(current_orientation)
      end

      private

      def north
        Direction.new(@position_x, @position_y + 1, @orientation)
      end

      def south
        Direction.new(@position_x, @position_y - 1, @orientation)
      end

      def west
        Direction.new(@position_x - 1, @position_y, @orientation)
      end

      def east
        Direction.new(@position_x + 1, @position_y, @orientation)
      end

      def method_missing(_name, *_args)
        raise NotValidMethodError
      end
    end
  end
end
