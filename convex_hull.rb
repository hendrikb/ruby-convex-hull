require 'point'
class ConvexHull
  def compute points=ConvexHull.load_example_points
    points.sort! {|a,b| a.x <=> b.x}
  end

end
