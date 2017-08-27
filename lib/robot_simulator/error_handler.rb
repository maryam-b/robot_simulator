module RobotSimulator
  class ErrorsHandler < StandardError
    def message
      'Something went wrong!'
    end
  end

  class NotValidCommandError < ErrorsHandler
    def message
      'Not a valid command! Please input a valid command.'
    end
  end

  class NotValidDirection < ErrorsHandler
    def message
      'You are not going to correct direction. Should Place your robot again or use LEFT or RIGHT command'
    end
  end

  class NotPlacedError < ErrorsHandler
    def message
      'Seems your robot is not placed yet!'
    end
  end

  class AbstractMethodError < ErrorsHandler
    def message
      'Abstract method'
    end
  end

  class NotValidMethodError < ErrorsHandler
    def message
      'Not valid request!'
    end
  end
end
