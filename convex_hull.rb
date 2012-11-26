require 'point'
class ConvexHull
  def compute points=ConvexHull.load_example_points
    points.sort! {|a,b| a.x <=> b.x}
  end

  def self.load_example_points
    [
      Point.new(141,2),
      Pont.new(396,417),
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
