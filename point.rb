class Point
  attr_accessor :x,:y
  def initialize x,y
    self.x=x
    self.y=y
  end

  def to_s
    "(#{x}:#{y})"
  end
end
