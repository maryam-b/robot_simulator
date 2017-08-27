module RobotSimulator
  class CommandsHandler
    PLACE_REGX = /^PLACE\s+(?<params>\d+\s*,\s*\d+\s*,\s*(NORTH|SOUTH|EAST|WEST))$/
    REPORT_REGEX = /^REPORT\s+(?<params>)$/
    LEFT_REGEX = /^LEFT\s+(?<params>)$/
    RIGHT_REGEX = /^RIGHT\s+(?<params>)$/
    MOVE_REGEX = /^MOVE\s+(?<params>)$/
    EXIT_REGEX = /^EXIT\s+(?<params>)$/i

    COMMANDS_MATCH = [
      [PLACE_REGX, Utils::Place],
      [REPORT_REGEX, Utils::Report],
      [LEFT_REGEX, Utils::Left],
      [RIGHT_REGEX, Utils::Right],
      [MOVE_REGEX, Utils::Move],
      [EXIT_REGEX, 'quit']
    ].freeze

    def initialize(table, robot)
      @table = table
      @robot = robot
    end

    def parser(input) # rubocop :disable AbcSize
      cmd = COMMANDS_MATCH.detect { |x| input =~ x[0] }
      raise(NotValidCommandError) unless cmd

      return if cmd[1] == 'quit'
      match = cmd[0].match(input)
      params = match[:params] ? match[:params].split(',') : nil
      direction = params.empty? ? nil : Utils::Direction.new(*params)
      cmd[1].new(@robot, @table, direction).exec!
    end
  end
end
