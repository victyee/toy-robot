require_relative '../lib/simulator'

RSpec.describe Simulator, "test commands" do
  it "creates new sessions" do
    20.times { Simulator.new }
    expect(@has_robot).to eq nil
  end
end