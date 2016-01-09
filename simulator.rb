require_relative 'commands.rb'
require_relative 'tests.rb'
require_relative 'robot.rb'


# Initial settings
@testMode = false
@hasRobot = false
@robotPosition = ['NORTH', 'SOUTH', 'EAST', 'WEST']
@maxX = 4
@maxY = 4


# Initiates the robot simulator
prompt_command