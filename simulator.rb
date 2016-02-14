require_relative 'robot'

class Simulator
  def initialize
    @has_robot = false
    @max_x = 4
    @min_x = 0
    @max_y = 4
    @min_y = 0
    @robot_positions = ['NORTH', 'SOUTH', 'EAST', 'WEST']
  end

  def prompt_command
    if @has_robot
      print "Input command > "
    else
      print "Place your robot > "
    end
    @command = $stdin.gets.chomp
    check_command
  end

  def check_command
    @command_split = @command.split(/\W+/)
    command = @command_split.first
    case command
    when "PLACE"
      if valid_x && valid_y && valid_f
        @has_robot = true
        @robot = Robot.new(@command_split[1], @command_split[2], @command_split[3])
      end
    when "REPORT"
      check_has_robot
      @robot.report
    when "MOVE"
      check_has_robot
      @robot.move
    when "LEFT"
      check_has_robot
      @robot.left
    when "RIGHT"
      check_has_robot
      @robot.right
    else
      puts "ERROR: Invalid command, please try again"
    end
    prompt_command
  end

  # Checks if entered X and Y axis are numbers
  def is_numeric?(obj) 
    obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end

  # Verify if X axis is valid
  def valid_x
    axis = @command_split[1]
    if is_numeric?(axis)
      if axis.to_i < @min_x || axis.to_i > @max_x
        puts "ERROR: X axis is out of range! "
        return false
      else
        return true
      end
    else
      puts "ERROR: Please enter a valid X axis"
      return false
    end
  end

  # Verifies if Y axis is valid
  def valid_y
    axis = @command_split[2]
    if is_numeric?(axis)
      if axis.to_i < @min_y || axis.to_i > @max_y
        puts "ERROR: Y axis is out of range! "
        return false
      else
        return true
      end
    else
      puts "ERROR: Please enter a valid Y axis"
      return false
    end
  end

  # Verifies if Position is valid
  def valid_f
    if @robot_positions.include? @command_split[3]
      return true
    else
      puts "ERROR: Please enter a valid position"
      return false
    end
  end

  def check_has_robot
    if !@has_robot
      puts "ERROR: Place robot first"
      prompt_command
    end
  end
end


@session = Simulator.new
@session.prompt_command