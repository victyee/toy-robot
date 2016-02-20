# Toyrobot
This is a toy robot simulator. It moves on a 5X5 dimension table top

## Installation
    $ git clone https://github.com/victyee/toy-robot.git
    $ cd toy-robot
    $ bundle install
    $ ruby toy-robot.rb
    
## Commands
Start by placing the toy robot on the table top
    `PLACE X,Y,F`

- `X` and `Y` can be numbers from `0` to `4`
- `F` can be either `NORTH`, `SOUTH`, `EAST` or `WEST`
- Example `PLACE 0,0,NORTH`

Other valid commands
- `MOVE` will move the robot forward one unit in the direction it is currently facing
- `LEFT` rotates the robot 90 degrees to the left. Robot's position doesn't change.
- `RIGHT` rotates the robot 90 degrees to the right. Robot's position doesn't change.
- `REPORT` return `X,Y,F` of the robot. E.g. `Output: 1,1,SOUTH`


## Simulation Constraints
- The toy robot is moving on a square tabletop of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but is prevented from falling to destruction.
- Any movement that would result in the robot falling from the table is prevented, however further valid movement commands are still allowed.
- The first valid command to the robot is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The application discards all commands in the sequence until a valid PLACE command has been executed.
- A robot that is not on the table ignores the MOVE, LEFT, RIGHT and REPORT commands.
- The application does not provide any graphical output showing the movement of the toy robot.

## Testing
Code quality is attempted using [RSpec](http://rspec.info/) for testing

Run tests:
`$ rspec`

## Troubleshooting
### Dependancies
`ruby version ~> 2.1.0p0`

To check your version run:
`$ ruby -v`

To learn how to install ruby visit ruby-lang.org/en/installation/

### Development environment
- Windows 8.1, ruby 2.2.4p230

### Development dependancies
`rspec ~> 3.0`

## Discussion
As a new developer, the robot test was more challlenging than expected. I've learnt to utilise Test Driven Development, OOP patterns, write better README and cleaner code. I'm not happy with the robot class. Currently there is a lot of unnecessary complexity in the code due to the amount of nested conditional logic. Will work on this.
