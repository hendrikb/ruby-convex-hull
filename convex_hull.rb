require './point.rb'
class ConvexHull
  def compute points=load_example_points
    points.sort! {|a,b| a.x <=> b.x}
    puts points.to_s
  end

  def load_example_points
    [
      Point.new(141,2),
      Point.new(396,417),
      Point.new(171,250),
      Point.new(277,352),
      Point.new(151,257),
      Point.new(80,478),
      Point.new(222,256),
      Point.new(100,69),
      Point.new(2,404),
      Point.new(332,315)
    ]
  end
end

c = ConvexHull.new
c.compute
