require_relative 'commands.rb'
require_relative 'tests.rb'
require_relative 'robot.rb'


# Initial settings
@test_mode = false
@has_robot = false
@robot_positions = ['NORTH', 'SOUTH', 'EAST', 'WEST']
@max_x = 4
@max_y = 4


# Initiates the robot simulator
prompt_command