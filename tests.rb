# TEST1 command
def test1
	@test_mode = true
	@command = "PLACE 0,0,NORTH"
	puts "Input command > #{@command}"
	check_command

	@command = "MOVE"
	puts "Input command > #{@command}"
	check_command

	@command = "REPORT"
	puts "Input command > #{@command}"
	check_command

	@test_mode = false
end


# TEST2 command
def test2
	@test_mode = true

	@command = "PLACE 0,0,NORTH"
	puts "Input command > #{@command}"
	check_command

	@command = "LEFT"
	puts "Input command > #{@command}"
	check_command

	@command = "REPORT"
	puts "Input command > #{@command}"
	check_command

	@test_mode = false
end


# TEST3 command
def test3
	@test_mode = true

	@command = "PLACE 1,2,EAST"
	puts "Input command > #{@command}"
	check_command

	@command = "MOVE"
	puts "Input command > #{@command}"
	check_command

	@command = "MOVE"
	puts "Input command > #{@command}"
	check_command

	@command = "LEFT"
	puts "Input command > #{@command}"
	check_command

	@command = "MOVE"
	puts "Input command > #{@command}"
	check_command

	@command = "REPORT"
	puts "Input command > #{@command}"
	check_command

	@test_mode = false
end

