# Sets robot's X and Y axis and position
def robot(x, y, f)
	@robot_x_axis = x
	@robot_y_axis = y
	@robot_facing = f
	check_testmode
end