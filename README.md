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

## Testing
Code quality is attempted using [RSpec](http://rspec.info/) for testing

Run tests:
`$ rspec`

## Dependancies
ruby version ~> 2.1.0p0
To check your version run:
`$ ruby -v`
To learn how to install ruby visit ruby-lang.org/en/installation/

## Development environment:
- Windows 8.1, ruby 2.2.4p230

## Development dependancies:
`rspec ~> 3.0`
