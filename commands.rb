# To verify if command input is valid
def check_command
	@command_split = @command.split(/\W+/)

	# Makes sure a robot is placed first before accepting other commands
	if @hasRobot == false && @command_split[0] !="PLACE"
		puts "You need to place the robot first!"
		prompt_command
	end

	# All available valid commands
	if @command_split[0] == "PLACE"
		place
	elsif @command_split[0] == "REPORT"
		report
	elsif @command_split[0] == "MOVE"
		move
	elsif @command_split[0] == "LEFT"
		left
	elsif @command_split[0] == "RIGHT"
		right
	else
		put "Invalid command. Try again"
		prompt_command
	end
end


# MOVE command
def move
	if @robot_facing == "NORTH"
		unless @robot_y_axis.to_i == 4
			@robot_y_axis = @robot_y_axis.to_i + 1
		else
			puts "Can't move. Will drop off the table"
		end
	elsif @robot_facing == "SOUTH"
		unless @robot_y_axis.to_i == 0
			@robot_y_axis = @robot_y_axis.to_i - 1
		else
			puts "Can't move. Will drop off the table"
		end
	elsif @robot_facing == "EAST"
		unless @robot_x_axis.to_i == 4
			@robot_x_axis = @robot_x_axis.to_i + 1
		else
			puts "Can't move. Will drop off the table"
		end
	elsif @robot_facing == "WEST"
		unless @robot_x_axis.to_i == 0
			@robot_x_axis = @robot_x_axis.to_i - 1
		else
			puts "Can't move. Will drop off the table"
		end
	end
	prompt_command
end


# LEFT command
def left
	if @robot_facing == "NORTH"
		@robot_facing = "WEST"
	elsif @robot_facing == "SOUTH"
		@robot_facing = "EAST"
	elsif @robot_facing == "EAST"
		@robot_facing = "NORTH"
	elsif @robot_facing == "WEST"
		@robot_facing = "SOUTH"
	end
	prompt_command
end


# RIGHT command
def right
	if @robot_facing == "NORTH"
		@robot_facing = "EAST"
	elsif @robot_facing == "SOUTH"
		@robot_facing = "WEST"
	elsif @robot_facing == "EAST"
		@robot_facing = "SOUTH"
	elsif @robot_facing == "WEST"
		@robot_facing = "NORTH"
	end
	prompt_command
end


# PLACE command
def place
	if validX && validY && validF
		@hasRobot = true
		robot(@command_split[1], @command_split[2], @command_split[3])
	else
		prompt_command
	end
end


#  REPORT command
def report
	puts "Output: #{@robot_x_axis},#{@robot_y_axis},#{@robot_facing}"
	prompt_command
end

# Initiates user's input
def prompt_command
	if @hasRobot == true
  	print "Input command > "
  else
  	print "Place your robot > "
  end
  @command = $stdin.gets.chomp
  check_command
end


# Checks if entered X and Y axis are numbers
def is_numeric?(obj) 
  obj.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
end


# Verify if X axis is valid
def validX
	axis = @command_split[1]
	if is_numeric?(axis)
		if axis.to_i < 0 || axis.to_i > @maxX
			print "X axis is out of range! "
			return false
		else
			return true
		end
	else
		puts "ERROR: Please enter a valid X axis"
		return false
	end
end


# Verify if Y axis is valid
def validY
	axis = @command_split[2]
	if is_numeric?(axis)
		if axis.to_i < 0 || axis.to_i > @maxY
			print "Y axis is out of range! "
			return false
		else
			return true
		end
	else
		puts "ERROR: Please enter a valid Y axis"
		return false
	end
end


# Verify if Position is valid
def validF
	if @robotPosition.include? @command_split[3]
		return true
	else
		puts "ERROR: Please enter a valid position"
		return false
	end
end


