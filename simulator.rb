require_relative 'toy_robot'

class Simulator
  def initialize
    @toy_robot = ToyRobot.new
  end

  def place(args)
    x, y, f = args.split(",")
    x = x.to_i
    y = y.to_i
    if (0..4).include?(x) && (0..4).include?(y)
      @toy_robot.place(x, y, f.upcase)
    else
      puts "x and y should be ranged from 0 to 4"
    end
  end

  def move
    return unless @toy_robot.placed
    if @toy_robot.f == "WEST" && 0 < @toy_robot.x then @toy_robot.x -= 1
    elsif @toy_robot.f == "EAST" && @toy_robot.x < 4 then @toy_robot.x += 1
    elsif @toy_robot.f == "NORTH" && @toy_robot.y < 4 then @toy_robot.y += 1
    elsif @toy_robot.f == "SOUTH" && 0 < @toy_robot.y then @toy_robot.y -= 1
    end
  end

  def left
    return unless @toy_robot.placed
    case @toy_robot.f
    when "WEST" then @toy_robot.f = "SOUTH"
    when "EAST" then @toy_robot.f = "NORTH"
    when "NORTH" then @toy_robot.f = "WEST"
    when "SOUTH" then @toy_robot.f = "EAST"
    end
  end

  def right
    return unless @toy_robot.placed
    case @toy_robot.f
    when "WEST" then @toy_robot.f = "NORTH"
    when "EAST" then @toy_robot.f = "SOUTH"
    when "NORTH" then @toy_robot.f = "EAST"
    when "SOUTH" then @toy_robot.f = "WEST"
    end
  end

  def report
    return unless @toy_robot.placed
    puts "#{@toy_robot.x},#{@toy_robot.y},#{@toy_robot.f}"
  end

  def get_input
    $stdin.gets.chomp
  end

  def execute
    user_choice = get_input
    until user_choice == "Q"
      command, args = user_choice.split(" ")
      case command
      when "PLACE" then place(args)
      when "MOVE" then move
      when "LEFT" then left
      when "RIGHT" then right
      when "REPORT" then report
      else
        puts "Invalid selection"
      end
      user_choice = get_input
    end
  end
end

if $PROGRAM_NAME == __FILE__
  simulator = Simulator.new
  simulator.execute
end
