module RobotSimulator
  module Utils
    class Report < Command
      def exec!
        puts robot_current_position
      end

      private

      def robot_current_position
        return 'Your robot is not placed yet!' if @robot.not_placed?
        "Current position is: #{@robot.report_formatted_position}"
      end
    end
  end
end
