module RobotSimulator
  class Table
    attr_reader :x, :y

    def initialize(x: 4, y: 4)
      @x = x
      @y = y
    end

    def position_valid?(direction)
      (0..x).cover?(direction.position_x) && (0..y).cover?(direction.position_y)
    end
  end
end
