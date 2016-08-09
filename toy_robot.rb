class ToyRobot
  attr_accessor :placed, :x, :y, :f
  def initialize
    @placed = false
  end

  def place(x, y, f)
    @x, @y, @f = x, y, f
    @placed = true
  end
end
