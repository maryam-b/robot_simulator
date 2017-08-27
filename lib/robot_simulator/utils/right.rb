module RobotSimulator
  module Utils
    class Right < Rotate
      def new_orientation
        ORIENTATIONS[(ORIENTATIONS.index(@robot.current_position.orientation) + 1) % 4]
      end
    end
  end
end
