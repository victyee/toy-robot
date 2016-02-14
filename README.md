# Toyrobot
This is a toy robot simulator. It moves on a 5X5 dimension table top

## Installation
    $ git clone https://github.com/victyee/toy-robot.git
    $ cd toy-robot
    $ ruby simulator.rb
    
## Commands
Start by placing the toy robot on the table top
    `PLACE X,Y,F`

- `X` and `Y` can be numbers from `0` to `4`
- `F` can be either `NORTH`, `SOUTH`, `EAST`, `WEST`
- Example `PLACE 0,0,NORTH`

Other valid commands
- `MOVE` will move the robot forward one unit in the direction it is currently facing
- `LEFT` rotates the robot 90 degress to the left. Robot's position doesn't change.
- `RIGHT` rotates the robot 90 degrees to the right. Robot's position doesn't change.
- `REPORT` return `X,Y,F` of the robot. E.g. `Output: 1,1,SOUTH`

## Testing
Code quality is attempted using [RSpec](http://rspec.info/) for testing

Run tests:
`$ rspec spec`
