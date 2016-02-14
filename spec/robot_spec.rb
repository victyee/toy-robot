require_relative '../robot'

RSpec.describe Robot, "test commands" do
  context "creates new robot" do
    it "1,2,NORTH" do
      robot = Robot.new(1,2,'NORTH')
      expect(robot.position).to eq "Output: 1,2,NORTH"
    end
    it "4,4,NORTH" do
      robot = Robot.new(4,4,'NORTH')
      expect(robot.position).to eq "Output: 4,4,NORTH"
    end

    it "2,2,SOUTH" do
      robot = Robot.new(2,2,'SOUTH')
      expect(robot.position).to eq "Output: 2,2,SOUTH"
    end
    it "4,4,SOUTH" do
      robot = Robot.new(4,4,'SOUTH')
      expect(robot.position).to eq "Output: 4,4,SOUTH"
    end

    it "3,0,EAST" do
      robot = Robot.new(3,0,'EAST')
      expect(robot.position).to eq "Output: 3,0,EAST"
    end
    it "4,2,EAST" do
      robot = Robot.new(4,2,'EAST')
      expect(robot.position).to eq "Output: 4,2,EAST"
    end   

    it "1,4,WEST" do
      robot = Robot.new(1,4,'WEST')
      expect(robot.position).to eq "Output: 1,4,WEST"
    end
    it "3,3,WEST" do
      robot = Robot.new(3,3,'WEST')
      expect(robot.position).to eq "Output: 3,3,WEST"
    end
  end

  context "doesn't creates new robot" do
    it "with out of range axis 1,6,NORTH" do
      robot = Robot.new(1,6,'NORTH')
      expect(@has_robot).to eq nil
    end

    it "with out of range axis -3,6,WEST" do
      robot = Robot.new(-3,6,'WEST')
      expect(@has_robot).to eq nil
    end

    it "with invalid direction 1,2,SOUTHWEST" do
      robot = Robot.new(1,2,'SOUTHWEST')
      expect(@has_robot).to eq nil
    end
  end

  context "properly MOVE within board" do
    it "PLACE 2,3,EAST, MOVE" do
      robot = Robot.new(2,3,'EAST')
      robot.move
      expect(robot.position).to eq "Output: 3,3,EAST"
    end

    it "PLACE 2,4,WEST, MOVE" do
      robot = Robot.new(2,4,'WEST')
      robot.move
      expect(robot.position).to eq "Output: 1,4,WEST"
    end
  end

  context "doesn't MOVE out of table" do
    it "PLACE 4,4,NORTH, MOVE" do
      robot = Robot.new(4,4,'NORTH')
      expect { robot.move }.to output("Can't move. Will drop off the table\n").to_stdout
    end

    it "PLACE 0,0,SOUTH, MOVE" do
      robot = Robot.new(0,0,'SOUTH')
      expect { robot.move }.to output("Can't move. Will drop off the table\n").to_stdout
    end
  end

  context "turns correctly to the LEFT" do
    it "PLACE 0,0,NORTH, LEFT" do
      robot = Robot.new(0,0,'NORTH')
      robot.left
      expect(robot.position).to eq "Output: 0,0,WEST"
    end

    it "PLACE 1,1,SOUTH, LEFT" do
      robot = Robot.new(1,1,'SOUTH')
      robot.left
      expect(robot.position).to eq "Output: 1,1,EAST"
    end
  end

  context "turns correctly to the RIGHT" do
    it "PLACE 0,0,NORTH, RIGHT" do
      robot = Robot.new(0,0,'NORTH')
      robot.right
      expect(robot.position).to eq "Output: 0,0,EAST"
    end

    it "PLACE 1,1,SOUTH, RIGHT" do
      robot = Robot.new(1,1,'SOUTH')
      robot.right
      expect(robot.position).to eq "Output: 1,1,WEST"
    end
  end

  context "TESTS" do
    it "PLACE 0,0,NORTH, MOVE, REPORT" do
      robot = Robot.new(0,0,'NORTH')
      robot.move
      robot.position
      expect(robot.position).to eq "Output: 0,1,NORTH"
    end

    it "PLACE 0,0,NORTH, LEFT, REPORT" do
      robot = Robot.new(0,0,'NORTH')
      robot.left
      robot.position
      expect(robot.position).to eq "Output: 0,0,WEST"
    end

    it "PLACE 1,2,EAST, MOVE, MOVE, LEFT, MOVE, REPORT" do
      robot = Robot.new(1,2,'EAST')
      robot.move
      robot.move
      robot.left
      robot.move
      robot.position
      expect(robot.position).to eq "Output: 3,3,NORTH"
    end
  end
end