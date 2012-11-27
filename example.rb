require 'lib/convex_hull'

## USAGE:
# Example 1: (note how p(3,5) is not part of the hull anymore)
# puts ConvexHull.compute [ p(1,1), p(2,1), p(3,5), p(4,3), p(7,3)], true

# Example 2
puts ConvexHull.compute load_example_points, true

# Example 3
# puts ConvexHull.compute load_csv_example_points, true




##### Helpers, never mind.

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

def load_csv_example_points
  points = Array.new
  CSV.foreach("./random_numbers.csv", col_sep: ";", headers: true) do |row|
    points.push Point.new(row[1].to_i, row[2].to_i)
  end
  points
end

def p x,y
  Point.new(x,y)
end
