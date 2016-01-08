# Initiates user's input
def prompt_command
	if @hasRobot == true
  	print "Input command > "
  else
  	print "Place your robot > "
  end
  @command = $stdin.gets.chomp
end