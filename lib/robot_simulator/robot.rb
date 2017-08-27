module RobotSimulator
  class Robot
    attr_accessor :current_position

    def initialize
      @current_position = nil
    end

    def not_placed?
      @current_position.nil?
    end

    def report_formatted_position
      raise NotPlacedError if not_placed?
      [@current_position.position_x, @current_position.position_y, @current_position.orientation].join(',')
    end
  end
end
