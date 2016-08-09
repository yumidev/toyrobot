require "byebug"
require "rspec"
require "stringio"
require_relative "simulator"

describe "simulator" do
  describe "execute" do
    it "places and moves the toy robot" do
      $stdin = StringIO.new("PLACE 0,0,NORTH\nMOVE\nREPORT\nQ")
      simulator = Simulator.new

      expect{ simulator.execute }.to output("0,1,NORTH\n").to_stdout
    end
    it "turns the direction of the toy robot" do
      $stdin = StringIO.new("PLACE 0,0,NORTH\nLEFT\nREPORT\nQ")
      simulator = Simulator.new

      expect{ simulator.execute }.to output("0,0,WEST\n").to_stdout
    end
    it "never makes the toy robot go out of the table" do
      $stdin = StringIO.new("PLACE 3,3,EAST\nMOVE\nMOVE\nREPORT\nQ")
      simulator = Simulator.new

      expect{ simulator.execute }.to output("4,3,EAST\n").to_stdout
    end
  end
end
