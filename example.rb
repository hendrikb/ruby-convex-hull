require_relative 'lib/convex_hull'
require_relative 'helpers'

## USAGE:
# Example 1: (note how p(3,5) is not part of the hull anymore)
# puts Geometry::ConvexHull.compute [ p(1,1), p(2,1), p(3,5), p(4,3), p(7,3)], true

# Example 2
puts Geometry::ConvexHull.compute load_example_points, true

# Example 3
# puts Geometry::ConvexHull.compute load_csv_example_points, true

