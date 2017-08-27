module RobotSimulator
  module Utils
    class Move < Command
      def exec!
        raise NotPlacedError if @robot.not_placed?
        perform_move
      end

      private

      def perform_move
        new_position = @robot.current_position.move_to
        raise NotValidDirection unless @table.position_valid?(new_position)
        @robot.current_position = new_position
      end
    end
  end
end
