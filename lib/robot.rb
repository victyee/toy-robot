class Robot
  def initialize(x,y,f)
    @has_robot = true
    @x_axis = x.to_i
    @y_axis = y.to_i
    @f_facing = f
  end

  # REPORT command
  def report
    puts "Output: #{@x_axis},#{@y_axis},#{@f_facing}"
  end

  # MOVE command
  def move
    facing = @f_facing
    case facing 
    when "NORTH"
      unless @y_axis >= 4
        @y_axis += 1
      else
        puts "Can't move. Will drop off the table"
      end
    when "SOUTH"
      unless @y_axis <= 0
        @y_axis -= 1
      else
        puts "Can't move. Will drop off the table"
      end
    when "EAST"
      unless @x_axis >= 4
        @x_axis += 1
      else
        puts "Can't move. Will drop off the table"
      end
    when "WEST"
      unless @x_axis <= 0
        @x_axis -= 1
      else
        puts "Can't move. Will drop off the table"
      end
    end
  end

  # LEFT command
  def left
    facing = @f_facing
    case facing 
    when "NORTH"
      @f_facing = "WEST"
    when "SOUTH"
      @f_facing = "EAST"
    when "EAST"
      @f_facing = "NORTH"
    when "WEST"
      @f_facing = "SOUTH"
    end
    return @robot
  end

  # RIGHT command
  def right
    facing = @f_facing
    case facing 
    when "NORTH"
      @f_facing = "EAST"
    when "SOUTH"
      @f_facing = "WEST"
    when "EAST"
      @f_facing = "SOUTH"
    when"WEST"
      @f_facing = "NORTH"
    end
    return @robot
  end
end
