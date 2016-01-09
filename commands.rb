# To verify if command input is valid
def check_command
	@command_split = @command.split(/\W+/)

	# Makes sure a robot is placed first before accepting other commands
	if @hasRobot == false && @command_split[0] !="PLACE"
		puts "You need to place the robot first!"
		prompt_command
	end
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


